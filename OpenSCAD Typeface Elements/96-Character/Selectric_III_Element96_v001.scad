// ---------- Selectric III (96-character) Typeball ----------

// -------------------
// Configuration
// -------------------

// Set to false for full character rendering (true = preview without letters)
PREVIEW_LABEL = false;

// The font name, as installed on your system
TYPEBALL_FONT = "Vogue";

// The font height (multiplied by faceScale=2.25 in LetterText)
LETTER_HEIGHT = 2.75;

// 96-character support (24 chars per row × 4 rows)
CHARACTERS_PER_LATITUDE = 24;
CHARACTER_LONGITUDE      = 360 / CHARACTERS_PER_LATITUDE;

// Nudge the whole charset around the ball (degrees).
// Use positive to rotate clockwise, negative for counter-clockwise.
CHAR_LAYOUT_ROTATION_OFFSET = 10;

// -------------------
// Character Set (exactly 96 entries, no trailing comma)
// -------------------

FULL_CHARSET = [
  // Row 1 (slots 1–24)
  "6","4","8","9","3","/","Z","³","&","%","@",")","¢","$","*","(","#","?","z","²","7","5","2","0",
  // Row 2 (25–48)
  "c","d","k","u","§","=",":","\"","I","S","T","E","C","B","K","U","¶","+",";","'","i","s","t","e",
  // Row 3 (49–72)
  "n","a","x","h","½","±","V","M","W","D","O","R","N","A","X","H","¼","°","v","m","w","b","o","r",
  // Row 4 (73–96)
  "y","f","l","g","]",",","_","!",".","J","Q","P","Y","F","L","G","[",",","-","1",".","j","p","q"
];

// -------------------
// Visual Tweaks
// -------------------

// Uniform stroke thickness tweak: applies a 2D offset to the entire glyph before 
// extrusion, making all strokes uniformly fatter (positive) or thinner (negative).
CHARACTER_WEIGHT_ADJUSTMENT = 0;

// Balance “smear” correction: inject a tiny horizontal offset before Minkowski/extrude
// so that, once the slug is curved and offset, the perceived stroke weight is even
// horizontally and vertically on the spherical surface.
HORIZONTAL_WEIGHT_ADJUSTMENT = 0.2;

// If letters with low descenders (g, j, p, q, y) extend into the detent-teeth area,
// trim those parts off so they don’t collide or leave artifacts.
TRIM_DESCENDERS             = true;

// -------------------
// Ball Geometry (tweak only for different hardware)
// -------------------

// How far each character slug sticks out from the spherical surface.
// Increase to make letters more pronounced; decrease to recess them.
LETTER_ALTITUDE           = 1.8;

// Fine-tune the tilt of each of the four rows of characters.
// This compensates for descenders (g, j, p, etc.) and balances visual weight.
//   ROW_TILT_ADJUST[0] → top row, [1] → second row, etc.
ROW_TILT_ADJUST           = [0, 0.5, 1, 2];

// Diameter of the virtual platen used to curve each slug’s face to match the typewriter platen.
// Larger values yield a flatter face; smaller values a more pronounced curve.
PLATEN_DIA                = 45;

// Preview (“Fast Render”) mesh resolution: lower → faster, rougher.
// Good for positioning and quick checks.
PREVIEW_FACETS            = 22;

// Final (“Full Render”) mesh resolution: higher → slower, smoother.
// Use for your final export or STL.
RENDER_FACETS             = 44;

// Choose the mesh resolution based on whether OpenSCAD’s $preview is active.
FACETS                    = $preview ? PREVIEW_FACETS : RENDER_FACETS;
FONT_FACETS               = FACETS;  // same resolution for extruded text curves
$fn                       = FACETS;  // global facet override for spheres/cylinders

// Angle (in degrees) between each of the four character rows.
// Controls vertical spacing around the ball.
TILT_ANGLE                = 16.2;

// Nudge every row up/down in latitude (positive = toward the flat top)
ROW_VERTICAL_OFFSET = -.5;  // try 3 or –3 to shift all rows

// Small adjustment applied only to the top row to correct any slight misalignment.
TOP_ROW_ADJUSTMENT        = -0.3;

// Enable or disable the full-length slot opposite the DEL triangle.
// Some Selectric models omit this; toggle if your tilt ring doesn’t use it.
SLOT                      = true;

// Outer radius of the typeball (half of the 33.4 mm diameter).
// Changing this will scale the entire ball.
TYPEBALL_RAD              = 33.4/2;

// Radius of the hollow interior where the reinforcement ribs attach.
// Thinner shells can reduce material but may weaken the ball.
INSIDE_RAD                = 28.15/2;

// Vertical offset (below the top) where the inner spherical pocket begins.
// Adjusting this changes the shell thickness at the top.
INSIDE_CURVE_START        = 2;

// Total height of the typeball including skirt, from flat top to skirt bottom.
TYPEBALL_HEIGHT           = 21.5;

// Height of the flat top surface above the sphere’s center.
// This defines how deep the boss and DEL triangle sit.
TYPEBALL_TOP_ABOVE_CENTRE = 11.4;

// Thickness of that flat top plate before the ribs begin.
TYPEBALL_TOP_THICKNESS    = 1.65;

// Distance from the sphere center to the base of the DEL triangle marker.
DEL_BASE_FROM_CENTRE      = 8.2;

// Depth of the DEL triangle cut into the flat top.
DEL_DEPTH                 = 0.6;

// Upper radius of the detent-teeth skirt (where teeth start).
TYPEBALL_SKIRT_TOP_RAD    = 31.9/2;

// Lower radius of the detent-teeth skirt (where teeth end).
TYPEBALL_SKIRT_BOTTOM_RAD = 30.5/2;

// Z-offset of the skirt’s top edge relative to the sphere center.
// Defines vertical placement of the teeth.
TYPEBALL_SKIRT_TOP_BELOW_CENTRE = -sqrt(
  TYPEBALL_RAD*TYPEBALL_RAD
  - TYPEBALL_SKIRT_TOP_RAD*TYPEBALL_SKIRT_TOP_RAD
);

// Vertical height of the detent-teeth skirt (depth of the teeth ring).
SKIRT_HEIGHT              = TYPEBALL_HEIGHT
                             - TYPEBALL_TOP_ABOVE_CENTRE
                             + TYPEBALL_SKIRT_TOP_BELOW_CENTRE;

// Radial offset of each detent-tooth peak from the sphere center.
// Controls how “tall” each tooth sits.
TOOTH_PEAK_OFFSET_FROM_CENTRE = 6.1;

// Inner and outer radii of the boss that fits into the tilt ring.
// These must match the typewriter’s tilt-ring socket dimensions.
BOSS_INNER_RAD            = 4.35;
BOSS_OUTER_RAD            = 5.8;

// Height of the boss (depth of the tilt-ring socket).
BOSS_HEIGHT               = 8.07;

// Rotation (degrees) of the small partial notch in the boss (mechanical key).
NOTCH_ANGLE               = 131.8;
// Width, depth, and height of that notch.
NOTCH_WIDTH               = 1.1;
NOTCH_DEPTH               = 2;
NOTCH_HEIGHT              = 2.2;

// Rotation (degrees) of the full-length slot opposite the notch.
SLOT_ANGLE                = NOTCH_ANGLE + 180;
// Width and depth of that slot.
SLOT_WIDTH                = 1.9;
SLOT_DEPTH                = 0.4;

// Number of internal reinforcement ribs under the top face.
// More ribs = stronger but heavier.
RIBS                      = 11;
// Physical dimensions of each rib (length from boss, thickness, height).
RIB_LENGTH                = 8;
RIB_WIDTH                 = 2;
RIB_HEIGHT                = 2.5;

// Tiny offset to prevent z-fighting where faces intersect.
EPSILON                   = 0.001;


// -------------------
// Modules
// -------------------

module Labels() {
  offset(r=0.12) {
    translate([-0.1,14,0])
      text("1O", size=2, font=TYPEBALL_FONT, halign="center");
    translate([0,0.6,0])
      text(TYPEBALL_FONT, size=2, font=TYPEBALL_FONT, halign="center");
    translate([0,-2.5,0])                // shift down below the font name
      text("96", size=2, font=TYPEBALL_FONT, halign="center");
  }
}


module SelectricLayout96() {
  for (l = [0 : 3]) {
    // base row angle + per-row tweak + global vertical offset
    tiltAngle = (2 - l) * TILT_ANGLE
               + (l == 0 ? TOP_ROW_ADJUSTMENT : 0)
               + ROW_VERTICAL_OFFSET;

    for (p = [0 : CHARACTERS_PER_LATITUDE - 1]) {
      idx  = CHARACTERS_PER_LATITUDE * l + p;
      char = FULL_CHARSET[idx];
      if (char != "") {
        // place each slug clockwise plus any rotation offset
        lon = p * CHARACTER_LONGITUDE + CHAR_LAYOUT_ROTATION_OFFSET;
        GlobalPosition(TYPEBALL_RAD, tiltAngle, lon, ROW_TILT_ADJUST[l])
          LetterText(LETTER_HEIGHT, LETTER_ALTITUDE, TYPEBALL_FONT, char);
      }
    }
  }
}



module TypeBall() {
  if (is_undef(PREVIEW_LABEL) || !PREVIEW_LABEL) {
    difference() {
      SelectricLayout96();
      TrimTop();
      if (TRIM_DESCENDERS)
        translate([
          0,0,
          TYPEBALL_SKIRT_TOP_BELOW_CENTRE - SKIRT_HEIGHT - EPSILON
        ])
          DetentTeeth();
    }
  }
  difference() {
    HollowBall();
    if (SLOT) Slot();
    Notch();
    Del();
    FontName();
  }
}

module GlobalPosition(r, latitude, longitude, rotAdjust) {
  x = r * cos(latitude);
  y = 0;
  z = r * sin(latitude);
  rotate([0,0,longitude])
    translate([x,y,z])
      rotate([0, 90 - latitude - rotAdjust, 0])
        children();
}

module LetterText(size_, height_, font_, letter_, platenDia = 40) {
  $fn = $preview ? 12 : 24;
  faceScale = 2.1;
  rotate([0,180,90])
    minkowski() {
      intersection() {
        translate([0, -size_/2, -height_])
          scale([0.5, 0.5, 2]) 
            linear_extrude(1)
              offset(CHARACTER_WEIGHT_ADJUSTMENT)
                minkowski() {
                  text(
                    size = size_ * faceScale,
                    font = font_,
                    halign = "center",
                    letter_
                  );
                  polygon([
                    [-HORIZONTAL_WEIGHT_ADJUSTMENT/2, 0],
                    [ HORIZONTAL_WEIGHT_ADJUSTMENT/2, 0],
                    [ HORIZONTAL_WEIGHT_ADJUSTMENT/2, EPSILON],
                    [-HORIZONTAL_WEIGHT_ADJUSTMENT/2, EPSILON]
                  ]);
                }
        translate([
          0,
          0,
          -platenDia/2 - height_/2 + 0.121
        ])
          rotate([0,90,0])
            difference() {
              cylinder(
                h = 100,
                r = platenDia/2 + 0.01,
                center = true,
                $fn = $preview ? 60 : 360
              );
              cylinder(
                h = 100,
                r = platenDia/2,
                center = true,
                $fn = $preview ? 60 : 360
              );
            }
      }
      cylinder(h = height_, r1 = 0, r2 = 0.75 * height_);
    }
}

module HollowBall() {
  difference() {
    Ball();
    translate([0, 0, -20 + INSIDE_CURVE_START])
      cylinder(r = INSIDE_RAD, h = 20, $fn = $preview ? 60 : 360);
  }
  Ribs();
}

module Ball() {
  removal = 20;
  difference() {
    sphere(r = TYPEBALL_RAD, $fn = $preview ? 40 : 160);
    translate([-50, -50, TYPEBALL_TOP_ABOVE_CENTRE - EPSILON])
      cube([100, 100, removal]);
    translate([-50, -50, TYPEBALL_SKIRT_TOP_BELOW_CENTRE - removal])
      cube([100, 100, removal]);
    intersection() {
      sphere(
        r  = sqrt(INSIDE_RAD * INSIDE_RAD + INSIDE_CURVE_START * INSIDE_CURVE_START),
        $fn = $preview ? 60 : 160
      );
      translate([-20, -20, INSIDE_CURVE_START - EPSILON])
        cube([40, 40, 20]);
    }
  }
  TopFace();
  DetentTeethSkirt();
  CentreBoss();
}

module DetentTeethSkirt() {
  difference() {
    // keep the skirt geometry exactly as before
    translate([0,0, TYPEBALL_SKIRT_TOP_BELOW_CENTRE - SKIRT_HEIGHT])
      cylinder(
        r2 = TYPEBALL_SKIRT_TOP_RAD,
        r1 = TYPEBALL_SKIRT_BOTTOM_RAD,
        h  = SKIRT_HEIGHT,
        $fn = 160
      );
    translate([0,0, TYPEBALL_SKIRT_TOP_BELOW_CENTRE - SKIRT_HEIGHT - EPSILON])
      DetentTeeth();
  }
}

module DetentTeeth() {
  for (i = [0 : CHARACTERS_PER_LATITUDE - 1]) {
    // match your character layout direction and offset
    angle = i * CHARACTER_LONGITUDE + CHAR_LAYOUT_ROTATION_OFFSET;
    rotate([0, 0, angle])
      Tooth();
  }
}



module Tooth() {
  translate([0, TOOTH_PEAK_OFFSET_FROM_CENTRE, 0])
    rotate([180, -90, 0])
      linear_extrude(30)
        polygon(points=[
          [0,    1.9], [2.2, 0.4], [3.2,  0.14],
          [3.2, -0.14], [2.2,-0.4], [0,   -1.9]
        ]);
}

module TopFace() {
  r = sqrt(TYPEBALL_RAD*TYPEBALL_RAD - TYPEBALL_TOP_ABOVE_CENTRE*TYPEBALL_TOP_ABOVE_CENTRE);
  difference() {
    translate([0,0, TYPEBALL_TOP_ABOVE_CENTRE - TYPEBALL_TOP_THICKNESS - RIB_HEIGHT])
      cylinder(r=r, h=TYPEBALL_TOP_THICKNESS + RIB_HEIGHT);
    translate([0,0, TYPEBALL_TOP_ABOVE_CENTRE - TYPEBALL_TOP_THICKNESS - RIB_HEIGHT - EPSILON])
      cylinder(h=RIB_HEIGHT/2, r1=r, r2=0);
    translate([0,0, TYPEBALL_TOP_ABOVE_CENTRE - TYPEBALL_TOP_THICKNESS - RIB_HEIGHT - EPSILON])
      cylinder(r=BOSS_INNER_RAD, h=TYPEBALL_TOP_THICKNESS*2 + RIB_HEIGHT);
    Del();
  }
}

module Del() {
  translate([DEL_BASE_FROM_CENTRE,0,TYPEBALL_TOP_ABOVE_CENTRE - DEL_DEPTH + EPSILON])
    color("white")
      linear_extrude(DEL_DEPTH)
        polygon(points=[[3.4,0],[0.4,1.3],[0.4,-1.3]]);
}

module FontName() {
  translate([-8.5,0,TYPEBALL_TOP_ABOVE_CENTRE - DEL_DEPTH])
    rotate([0,0,270])
      linear_extrude(DEL_DEPTH + 0.01) Labels();
}

module TrimTop() {
  translate([-50,-50,TYPEBALL_TOP_ABOVE_CENTRE]) cube([100,100,20]);
}

module CentreBoss() {
  translate([0,0,TYPEBALL_TOP_ABOVE_CENTRE - BOSS_HEIGHT])
    difference() {
      cylinder(r=BOSS_OUTER_RAD, h=BOSS_HEIGHT);
      translate([0,0,-EPSILON])
        cylinder(r=BOSS_INNER_RAD, h=BOSS_HEIGHT + 2*EPSILON);
    }
}

module Slot() {
  rotate([0,0,SLOT_ANGLE])
    translate([0,-SLOT_WIDTH/2,0])
      cube([SLOT_DEPTH + BOSS_INNER_RAD, SLOT_WIDTH, 40]);
}

module Notch() {
  rotate([0,0,NOTCH_ANGLE])
    translate([0,-NOTCH_WIDTH/2,TYPEBALL_TOP_ABOVE_CENTRE - BOSS_HEIGHT - EPSILON])
      cube([NOTCH_DEPTH + BOSS_INNER_RAD, NOTCH_WIDTH, NOTCH_HEIGHT + EPSILON]);
}

module Ribs() {
  segment = 360 / RIBS;
  for (i = [0:RIBS-1])
    rotate([0,5,-360.0/44 + segment * i])
      translate([
        BOSS_OUTER_RAD - 1.5, -RIB_WIDTH/2,
        TYPEBALL_TOP_ABOVE_CENTRE - TYPEBALL_TOP_THICKNESS - 0.8*RIB_HEIGHT
      ])
        cube([RIB_LENGTH, RIB_WIDTH, RIB_HEIGHT]);
}

// -------------------
// Top-level call
// -------------------

TypeBall();

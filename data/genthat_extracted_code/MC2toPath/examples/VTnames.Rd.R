library(MC2toPath)


### Name: VTnames
### Title: VTYPE names by base calibration
### Aliases: VTnames
### Keywords: ~kwd1 data

### ** Examples

## The function is currently defined as
function (baseCalibration) 
{
    if (baseCalibration == "CONUS") {
        c("cold barren", "tundra aka alpine", "taiga-tundra", 
            "boreal needleleaf forest", "boreal woodland", "subalpine forest", 
            "maritime needleleaf forest", "temperate needleleaf forest", 
            "temperate deciduous broadleaf forest", "cool mixed forest", 
            "temperate warm mixed forest", "temperate needleleaf woodland", 
            "temperate deciduous broadleaf woodland", "temperate cool mixed woodland", 
            "temperate warm mixed woodland", "C3 shrubland", 
            "C3 grassland", "temperate desert and semidesert", 
            "subtropical needleleaf forest", "subtropical deciduous broadleaf forest", 
            "warm evergreen broadleaf forest", "subtropical mixed forest", 
            "subtropical needleleaf woodland", "subtropical deciduous broadleaf woodland", 
            "subtropical evergreen broadleaf woodland", "subtropical mixed woodland", 
            "C4 shrubland", "C4 grassland", "subtropical desert and semidesert", 
            "tropical evergreen broadleaf forest", "tropical deciduous woodland", 
            "tropical savanna", "unused33", "unused34", "tropical desert", 
            "moist temperate needleleaf forest", "unused37", 
            "subalpine meadow", "water and wetlands", "natural barren", 
            "developed", "larch forest", "unused43", "unused44", 
            "unused45", "unused46", "unused47", "unused48", "dry temperate needleleaf forest")
    }
    else if (baseCalibration == "WCR") {
        c("cold barren", "tundra aka alpine", "taiga-tundra", 
            "boreal needleleaf forest", "boreal woodland", "subalpine forest", 
            "maritime needleleaf forest", "temperate needleleaf forest", 
            "temperate deciduous broadleaf forest", "cool mixed forest", 
            "temperate warm mixed forest", "temperate needleleaf woodland", 
            "temperate deciduous broadleaf woodland", "temperate cool mixed woodland", 
            "temperate warm mixed woodland", "C3 shrubland", 
            "C3 grassland", "temperate desert and semidesert", 
            "subtropical needleleaf forest", "subtropical deciduous broadleaf forest", 
            "warm evergreen broadleaf forest", "subtropical mixed forest", 
            "subtropical needleleaf woodland", "subtropical deciduous broadleaf woodland", 
            "subtropical evergreen broadleaf woodland", "subtropical mixed woodland", 
            "C4 shrubland", "C4 grassland", "subtropical desert and semidesert", 
            "tropical evergreen broadleaf forest", "tropical deciduous woodland", 
            "tropical savanna", "unused33", "unused34", "tropical desert", 
            "cool needleleaf forest", "unused37", "subalpine meadow", 
            "water and wetlands", "natural barren", "developed", 
            "larch forest", "Sitka spruce zone", "western hemlock zone", 
            "Pacific silver fir zone", "mountain hemlock zone", 
            "subalpine fir zone", "subalpine parkland zone")
    }
    else stopifnot(FALSE)
  }




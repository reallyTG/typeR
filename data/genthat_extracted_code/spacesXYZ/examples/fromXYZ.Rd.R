library(spacesXYZ)


### Name: fromXYZ
### Title: Convert from XYZ to other Color Spaces
### Aliases: xyYfromXYZ LabfromXYZ LuvfromXYZ
### Keywords: XYZ

### ** Examples

D65 = standardXYZ( 'D65' )

xyYfromXYZ( D65 )
##              x         y Y
##  D65 0.3127266 0.3290231 1     # probably not familiar

round( xyYfromXYZ(D65), 4 )
##           x     y Y
##  D65 0.3127 0.329 1        # probably more familiar


LabfromXYZ( 0.18*D65, D65 )   # 18% gray card
##             L a b
##  D65 49.49611 0 0          # exactly neutral, and L is about 50


D50 = standardXYZ( 'D50' )

LabfromXYZ( D50, D65 )
##        L        a        b
##  D50 100 2.399554 17.65321   # D50 is far from neutral (yellowish) in D65 viewing environment




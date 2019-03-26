library(spacesXYZ)


### Name: adaptation
### Title: Chromatic Adaptation Transforms (CATs)
### Aliases: CAT
### Keywords: adaptation

### ** Examples

D65toC = CAT( 'D65', 'C' )
D65toC

##  $method
##  [1] "Bradford"
##  
##  $Ma
##          X       Y       Z
##  L  0.8951  0.2664 -0.1614
##  M -0.7502  1.7135  0.0367
##  S  0.0389 -0.0685  1.0296
##  
##  $source.XYZ
##            X Y       Z
##  D65 0.95047 1 1.08883
##  
##  $source.xyY
##              x         y Y
##  D65 0.3127266 0.3290231 1
##  
##  $target.XYZ
##          X Y       Z
##  C 0.98074 1 1.18232
##  
##  $target.xyY
##            x         y Y
##  C 0.3100605 0.3161496 1
##  
##  $M
##              X            Y           Z
##  X 1.009778519  0.007041913 0.012797129
##  Y 0.012311347  0.984709398 0.003296232
##  Z 0.003828375 -0.007233061 1.089163878
##  
##  attr(,"class")
##  [1] "CAT"  "list"


adaptXYZ( D65toC, c(1,1,0.5) )
##              X         Y         Z
##  [1,] 1.023219 0.9986689 0.5411773




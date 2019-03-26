library(RFishBC)


### Name: bcFuns
### Title: Creates a function for a specific model.
### Aliases: bcFuns
### Keywords: manip

### ** Examples

## Simple Examples
( bcm1 <- bcFuns(1) )
bcm1(20,10,40)

## Example with dummy length-at-cap, radii-at-cap, and radii-at-age
lencap <- c(100,100,100,150,150)
radcap <- c(20,20,20,30,30)
rad    <- c( 5,10,15,15,25)
bcm1(lencap,rad,radcap)

( bcm2 <- bcFuns("FRALE") )
bcm2(lencap,rad,radcap,2)  # demonstrated with a=2





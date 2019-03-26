library(StereoMorph)


### Name: findOptimalPointAlignment
### Title: Optimally aligns one point set to another
### Aliases: findOptimalPointAlignment

### ** Examples

## MAKE MATRIX OF 3D POINTS
m1 <- matrix(c(0,0,0, 1,3,2, 4,2,1, 5,5,3, 1,4,2, 3,6,4), nrow=6, ncol=3)

## COPY TO M2
m2 <- m1

## MAKE MISSING POINT IN M1
## ALTHOUGH NOT USED IN THE ALIGNMENT THE CORRESPONDING POINT
##  IN M2 IS STILL RETURNED AFTER ALIGNMENT
m1[3, ] <- NA

## CENTER M2 ABOUT CE
m2 <- m2 %*% rotationMatrixZYX_SM(pi/6, -pi/3, pi/8)

## TRANSLATE M2
m2 <- m2 + matrix(c(2,3,4), nrow=6, ncol=3, byrow=TRUE)

## ALIGN M2 TO M1
m3 <- findOptimalPointAlignment(m1, m2)

## NOTE THAT RETURNED MATRIX IS IDENTICAL TO M1
## OF COURSE REAL WORLD DATA WILL HAVE SOME ERROR
m1
m3




library(SDraw)


### Name: sss.polygon
### Title: Draws a Simple Systematic Sample (SSS) from an area resource
###   (polygons).
### Aliases: sss.polygon
### Keywords: design survey

### ** Examples


# A square grid oriented east-west
WA.samp <- sss.polygon( WA, 100 )   
plot( WA )
points( WA.samp )

# A rectangular grid oriented east-west, with relative spacing c(0.667, 1.5),
# or 1 to 2.25.
WA.samp <- sss.polygon( WA, 100, spacing=c(2,3) )   
plot( WA )
points( WA.samp )

# A rectangular grid oriented east-west, with x spacing = 2*(y spacing). 
WA.samp <- sss.polygon( WA, 100, spacing=c(sqrt(2),1) )   

# A rectangular grid, random orientation, with y spacing = 3*(x spacing)
WA.samp <- sss.polygon( WA, 100, spacing=c(1,sqrt(3)), rand.dir=TRUE )   

# A triangular grid oriented east-west
WA.samp <- sss.polygon( WA, 100, triangular=TRUE )   

# A triangular grid oriented east-west, with relative spacing c(.667,1.5)
WA.samp <- sss.polygon( WA, 100, spacing=c(2,3), triangular=TRUE )   






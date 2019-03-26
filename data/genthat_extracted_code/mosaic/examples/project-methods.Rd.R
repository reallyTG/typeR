library(mosaic)


### Name: project
### Title: Projections
### Aliases: project project,formula-method project,numeric-method
###   project,matrix-method vlength dot

### ** Examples

x1 <- c(1,0,0); x2 <- c(1,2,3); y1 <- c(3,4,5); y2 <- rnorm(3)
# projection onto the 1 vector gives the mean vector
mean(y2)            
project(y2, 1)
# return the length of the vector, rather than the vector itself
project(y2, 1, type='length')
project(y1 ~ x1 + x2) -> pr; pr
# recover the projected vector 
cbind(x1,x2) %*% pr -> v; v
project( y1 ~ x1 + x2, coefficients=FALSE )
dot( y1 - v, v ) # left over should be orthogonal to projection, so this should be ~ 0
if (require(mosaicData)) {
project(width~length+sex, data=KidsFeet)
}
vlength(rep(1,4))
if (require(mosaicData)) {
m <- lm( length ~ width, data=KidsFeet )
# These should be the same
vlength( m$effects )  
vlength( KidsFeet$length)
# So should these
vlength( tail(m$effects, -2) )
sqrt(sum(resid(m)^2))
}
v <- c(1,1,1); w <- c(1,2,3)
u <- v / vlength(v)  # make a unit vector
# The following should be the same:
project(w,v, type="coef") * v 
project(w,v)
# The following are equivalent
abs(dot( w, u ))
vlength( project( w, u) )
vlength( project( w, v) )
project( w, v, type='length' )




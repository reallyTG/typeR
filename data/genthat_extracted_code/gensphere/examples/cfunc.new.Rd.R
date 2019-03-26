library(gensphere)


### Name: cfunc.new
### Title: Define and evaluate a contour function
### Aliases: cfunc.new cfunc.add.term cfunc.finish cfunc.eval

### ** Examples

# 2-dim diamond
cfunc1 <- cfunc.new(d=2)
cfunc1 <- cfunc.add.term( cfunc1,"lp.norm",k=c(1,1))
cfunc1 <- cfunc.finish( cfunc1 )
cfunc1
cfunc.eval( cfunc1, c(sqrt(2)/2, sqrt(2)/2) )
## No test: 
plot( cfunc1, col='red', lwd=3, main="diamond contour")
## End(No test)

# 2-dim blob
cfunc2 <- cfunc.new(d=2)
cfunc2 <- cfunc.add.term( cfunc2,"constant",k=1)
cfunc2 <- cfunc.add.term( cfunc2,"proj.normal",k=c( 1, sqrt(2)/2, sqrt(2)/2, 0.1) )
cfunc2 <- cfunc.add.term( cfunc2,"proj.normal",k=c( 1, -1,0, 0.1) )
cfunc2 <- cfunc.finish( cfunc2, nsubdiv=4 )
## No test: 
plot( cfunc2, col='green', lwd=3, main="contour with two bumps")

# 3-dim star-like contour
cfunc3 <- cfunc.new(d=3)
cfunc3 <- cfunc.add.term( cfunc3, "constant", k=0.5 )
for (i in 1:3) {
  u <- c(0,0,0);  u[i] <- 1  # i-th unit vector
  cfunc3 <- cfunc.add.term( cfunc3, "cone", k=c(1,u,.2) )
  cfunc3 <- cfunc.add.term( cfunc3, "cone", k=c(1,-u,.2) )
}  
cfunc3 <- cfunc.finish( cfunc3, maxEvals=400000 ) # this is slow, ~ 15 min

plot( cfunc3, show.faces=TRUE, col='blue')
nS <- dim(cfunc3$tessellation$S)[3]
title3d( paste("star with",nS,"simplices"))
## End(No test)




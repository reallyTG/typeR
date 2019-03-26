library(dst)


### Name: plautrans
### Title: Plausibility transformation of the singletons of a frame
### Aliases: plautrans

### ** Examples

 
x <- bca(f=matrix(c(0,1,1,1,1,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5, 0.3), 
cnames =c("a", "b", "c"), 
infovarnames = "x", varnb = 1)
plautrans(x)




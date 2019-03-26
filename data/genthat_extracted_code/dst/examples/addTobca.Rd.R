library(dst)


### Name: addTobca
### Title: Add some elements of 0 mass to an existing mass function
### Aliases: addTobca

### ** Examples

 
y <- bca(f=matrix(c(1,0,0,1,1,1),nrow=2, byrow = TRUE), 
m=c(0.6, 0.4),  cnames = c("a", "b", "c"), varnb=1)
addTobca(y, matrix(c(0,1,0,0,0,1, 0,1,1), nrow=3, byrow = TRUE))
x <- bca(f=matrix(c(0,1,1,1,1,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5, 0.3), 
cnames =c("a", "b", "c"), varnb=1)
xy <- dsrwon(x,y)
xy1 <- addTobca(nzdsr(xy), matrix(c(0,1,0,0,0,1), nrow=2, byrow = TRUE))
xy1
addTobca(x, f = diag(1,  ncol(x$tt) ) ) # add all singletons




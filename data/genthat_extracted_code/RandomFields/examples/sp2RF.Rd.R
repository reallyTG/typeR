library(RandomFields)


### Name: sp2RF
### Title: Transformation of an 'sp' object to an 'RFsp' object
### Aliases: sp2RF
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample(reduced=FALSE)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

p <- 100
n <- 5
x <- runif(p, 0, 1)
y <- runif(p, 0, 1)
z <- RFsimulate(RMexp(), x=x, y=y, n=n)
z1 <- z2 <- as.data.frame(z)
coordinates(z2) <- ~coords.x1 + coords.x2

(emp.var <- RFvariogram(data=z))
(emp.var1 <- RFvariogram(data=z1))
(emp.var2 <- RFvariogram(data=sp2RF(z2, param=list(n=n, vdim=1))))

stopifnot(all.equal(emp.var, emp.var1))
stopifnot(all.equal(emp.var, emp.var2))
## Don't show: 
FinalizeExample()
## End(Don't show)




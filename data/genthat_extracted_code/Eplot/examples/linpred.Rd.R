library(Eplot)


### Name: linpred
### Title: linpred
### Aliases: linpred

### ** Examples

x = rnorm(100)
lx <- lagmat(x,2)
tail(lx)
tail(x)
out <- linpred(x,lx)
plott(x, return.to.default=FALSE)
plott(out,add=TRUE,col=2)




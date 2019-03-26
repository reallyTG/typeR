library(paleoTS)


### Name: fitGpunc
### Title: Analyze evolutionary models with unsampled punctuations
### Aliases: fitGpunc opt.punc opt.joint.punc logL.punc logL.punc.omega
###   logL.joint.punc logL.joint.punc.omega
### Keywords: models ts

### ** Examples

x<- sim.punc(theta=c(0,5), ns=c(20,20), omega=c(0.5,0.5), vp=0.2)
w<- fitGpunc(x, ng=2, minb=7, pool=TRUE, oshare=TRUE)
print (w$parameters)
## plot using modelFit argument to show the solution
plot(x, modelFit=w)

## now, plot logL with respect to shift point
shift.times<- x$tt[w$GG]
plot(shift.times, w$all.logl, typ="o", cex=0.5, 
     main="Log-likelihood of different shift times")





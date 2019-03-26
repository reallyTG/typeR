library(fitteR)


### Name: fitter
### Title: Fit distributions to empirical data
### Aliases: fitter

### ** Examples

# continous empirical data
x <- rnorm(1000, 50, 3)
if(requireNamespace("ExtDist")){
r <- fitter(x, dom="c", posList=list(stats=c("dexp"), ExtDist=c("dCauchy")))
}else{
r <- fitter(x, dom="c", posList=list(stats=c("dexp", "dt")))
}

# discrete empirical data
x <- rnbinom(100, 0.5, 0.2)
r <- fitter(x, dom="dis", posList=list(stats=NA))





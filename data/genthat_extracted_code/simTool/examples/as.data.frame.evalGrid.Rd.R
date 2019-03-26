library(simTool)


### Name: as.data.frame.evalGrid
### Title: Converts an 'evalGrid' object into a 'data.frame'
### Aliases: as.data.frame.evalGrid

### ** Examples


genRegData <- function(){
 data.frame(
     x = 1:10,
     y = rnorm(10, mean=1:10))
}

eg <- evalGrids(
 expandGrid(fun="genRegData"),
 expandGrid(proc="lm", formula=c("y ~ x", "y ~ x + I(x^2)")),
 replications=5)

lm2df = function(lm.object) {
 ret = coef(summary.lm(lm.object))[, 1:2]
 data.frame(covariable = rownames(ret), ret, check.names=FALSE)
}
as.data.frame(eg, convert.result.fun=lm2df, progress=TRUE)
as.data.frame(eg, convert.result.fun=lm2df, summary.fun=c(mean, sd), progress=TRUE)




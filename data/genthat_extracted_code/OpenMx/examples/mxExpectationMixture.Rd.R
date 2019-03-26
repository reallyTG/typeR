library(OpenMx)


### Name: mxExpectationMixture
### Title: Mixture expectation
### Aliases: MxExpectationMixture-class mxExpectationMixture
###   print,MxExpectationMixture-method show,MxExpectationMixture-method

### ** Examples

library(OpenMx)

set.seed(1)

trail <- c(rep(1,480), rep(2,520))
trailN <- sapply(trail, function(v) rnorm(1, mean=v))

classes <- list()

for (cl in 1:2) {
  classes[[cl]] <- mxModel(paste0("class", cl), type="RAM",
                           manifestVars=c("ob"),
                           mxPath("one", "ob", value=cl, free=FALSE),
                           mxPath("ob", arrows=2, value=1, free=FALSE),
                           mxFitFunctionML(vector=TRUE))
}

mix1 <- mxModel(
  "mix1", classes,
  mxData(data.frame(ob=trailN), "raw"),
  mxMatrix(values=1, nrow=1, ncol=2, free=c(FALSE,TRUE), name="weights"),
  mxExpectationMixture(paste0("class",1:2), scale="softmax"),
  mxFitFunctionML())

mix1Fit <- mxRun(mix1)




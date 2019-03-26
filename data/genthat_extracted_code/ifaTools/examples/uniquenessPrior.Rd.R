library(ifaTools)


### Name: uniquenessPrior
### Title: Uniqueness prior to assist in item factor analysis
### Aliases: uniquenessPrior

### ** Examples

numItems <- 6
spec <- list()
spec[1:numItems] <- list(rpf.drm(factors=2))
names(spec) <- paste0("i", 1:numItems)
item <- mxMatrix(name="item", free=TRUE,
                 values=mxSimplify2Array(lapply(spec, rpf.rparam)))
item$labels[1:2,] <- paste0('p',1:(numItems * 2))
data <- rpf.sample(100, spec, item$values)  # use a larger sample size
m1 <- mxModel(model="m1", item,
              mxData(observed=data, type="raw"),
              mxExpectationBA81(spec),
              mxFitFunctionML())
up <- uniquenessPrior(m1, 2)
container <- mxModel("container", m1, up,
                     mxFitFunctionMultigroup(c("m1", "uniquenessPrior")),
                     mxComputeSequence(list(
                       mxComputeOnce('fitfunction', c('fit','gradient')),
                       mxComputeReportDeriv())))
container <- mxRun(container)
container$output$fit
container$output$gradient




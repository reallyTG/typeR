library(OpenMx)


### Name: mxExpectationBA81
### Title: Create a Bock & Aitkin (1981) expectation
### Aliases: mxExpectationBA81 MxExpectationBA81-class
###   show,MxExpectationBA81-method print,MxExpectationBA81-method

### ** Examples

library(OpenMx)
library(rpf)

numItems <- 14

# Create item specifications
spec <- list()
for (ix in 1:numItems) { spec[[ix]] <- rpf.grm(outcomes=sample(2:7, 1)) }
names(spec) <- paste("i", 1:numItems, sep="")

# Generate some random "true" parameter values
correct.mat <- mxSimplify2Array(lapply(spec, rpf.rparam))

# Generate some example data
data <- rpf.sample(500, spec, correct.mat)

# Create a matrix of item parameters with starting values
imat <- mxMatrix(name="item",
                 values=mxSimplify2Array(lapply(spec, rpf.rparam)))
rownames(imat)[1] <- 'f1'
imat$free[!is.na(correct.mat)] <- TRUE
imat$values[!imat$free] <- NA

# Create a compute plan
plan <- mxComputeSequence(list(
  mxComputeEM('expectation', 'scores',
              mxComputeNewtonRaphson(), information="oakes1999",
              infoArgs=list(fitfunction='fitfunction')),
  mxComputeHessianQuality(),
  mxComputeStandardError(),
  mxComputeReportDeriv()))

# Build the OpenMx model
grmModel <- mxModel(model="grm1", imat,
                    mxData(observed=data, type="raw"),
                    mxExpectationBA81(ItemSpec=spec),
                    mxFitFunctionML(),
                    plan)

grmModel <- mxRun(grmModel)
summary(grmModel)




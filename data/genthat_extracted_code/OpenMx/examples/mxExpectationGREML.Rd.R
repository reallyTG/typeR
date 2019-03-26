library(OpenMx)


### Name: mxExpectationGREML
### Title: Create MxExpectationGREML Object
### Aliases: mxExpectationGREML

### ** Examples

dat <- cbind(rnorm(100),rep(1,100))
colnames(dat) <- c("y","x")

ge <- mxExpectationGREML(V="V",yvars="y",Xvars=list("X"),addOnes=FALSE)
gff <- mxFitFunctionGREML(dV=c(ve="I"))
plan <- mxComputeSequence(freeSet=c("Ve"),steps=list(
  mxComputeNewtonRaphson(fitfunction="fitfunction"),
  mxComputeOnce('fitfunction',
    c('fit','gradient','hessian','ihessian')),
  mxComputeStandardError(),
  mxComputeReportDeriv(),
  mxComputeReportExpectation()
))

testmod <- mxModel(
  "GREMLtest",
  mxData(observed = dat, type="raw"),
  mxMatrix(type = "Full", nrow = 1, ncol=1, free=TRUE,
    values = 1, labels = "ve", lbound = 0.0001, name = "Ve"),
  mxMatrix("Iden",nrow=100,name="I",condenseSlots=TRUE),
  mxAlgebra(I %x% Ve,name="V"),
  ge,
  gff,
  plan
)
str(testmod)




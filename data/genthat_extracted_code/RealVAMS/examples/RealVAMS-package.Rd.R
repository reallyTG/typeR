library(RealVAMS)


### Name: RealVAMS-package
### Title: Multivariate VAM Fitting
### Aliases: RealVAMS-package
### Keywords: package

### ** Examples

data(example.score.data)
data(example.outcome.data)
#The next line exists to show that the function can run and that the package
#installed correctly. This is a CRAN requirement to ensure that the package
#works in future version of R
RealVAMS(example.score.data,example.outcome.data,max.PQL.it=1,max.iter.EM=2,
var.parm.hessian=FALSE)

## No test: 
res<-RealVAMS(example.score.data,example.outcome.data)
## End(No test)




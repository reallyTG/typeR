library(RealVAMS)


### Name: RealVAMS
### Title: Multivariate VAM Fitting
### Aliases: RealVAMS
### Keywords: regression

### ** Examples

data(example.score.data)
data(example.outcome.data)
#The next line exists to show that the function can run and that the package
#installed correctly
RealVAMS(example.score.data,example.outcome.data,max.PQL.it=1,max.iter.EM=2,
var.parm.hessian=FALSE)

## No test: 
res<-RealVAMS(example.score.data,example.outcome.data)
## End(No test)




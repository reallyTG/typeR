library(PSM)


### Name: PSM.template
### Title: Creates a template for a model in PSM
### Aliases: PSM.template
### Keywords: htest models multivariate ts

### ** Examples

# Linear model with input, random effects and dose
PSM.template(Linear=TRUE,dimX=1,dimY=2,dimU=3,dimEta=4)

# Non-linear model without input, random effects and dose
PSM.template(Linear=FALSE,dimX=1,dimY=2,dimU=0,dimEta=0)




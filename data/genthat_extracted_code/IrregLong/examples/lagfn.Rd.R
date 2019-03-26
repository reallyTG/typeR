library(IrregLong)


### Name: lagfn
### Title: Create lagged versions the variables in data
### Aliases: lagfn

### ** Examples

library(nlme)
data(Phenobarb)
head(Phenobarb)

data <- lagfn(Phenobarb,"time","Subject","time")
head(data)




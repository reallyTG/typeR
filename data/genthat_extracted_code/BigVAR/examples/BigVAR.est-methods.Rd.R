library(BigVAR)


### Name: BigVAR.est
### Title: BigVAR Estimation
### Aliases: BigVAR.est BigVAR.est,BigVAR-method

### ** Examples

data(Y)
Y=Y[1:100,]
#construct a Basic VAR-L
Model1=constructModel(Y,p=4,struct="Basic",gran=c(50,10))
BigVAR.est(Model1)




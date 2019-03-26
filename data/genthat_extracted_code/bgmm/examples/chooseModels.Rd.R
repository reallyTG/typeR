library(bgmm)


### Name: chooseModels
### Title: Selecting a subset of fitted models
### Aliases: chooseModels chooseOptimal

### ** Examples

 simulated = simulateData(d=2, k=3, n=100, m=50, cov="0", within="E", n.labels=2)
 
 models3 = beliefList(X=simulated$X, knowns=simulated$knowns, B=simulated$B,
               kList=2:4, mean="D", within="D")
 plotGIC(models3, penalty="BIC")

## Do not run
## It could take more than one minute
# simulated = simulateData(d=2, k=3, n=300, m=60, cov="0", within="E", n.labels=2)
# 
# models3 = beliefList(X=simulated$X, knowns=simulated$knowns, B=simulated$B,
#               kList=2:7, mean="D")
# plotGIC(models3, penalty="BIC")
#
# models4 = chooseModels(models3, kList=2:5, struct=c("DDDD","DDED","DDE0"))
# plot(models4)
# plotGIC(models4, penalty="BIC")
#
# model4 = chooseOptimal(models3, "BIC")
# plot(model4)




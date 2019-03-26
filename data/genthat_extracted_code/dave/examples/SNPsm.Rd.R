library(dave)


### Name: SNPsm
### Title: The spatial and temporal model of succession in the Swiss
###   National Park
### Aliases: SNPsm SNPsm.default plot.SNPsm SNPsm2
### Keywords: models multivariate

### ** Examples

r6=NULL           # imposes default growth rates
o.stSNP<- SNPsm(trange=100,tsl=10.0,diff=0.001,r6)
plot(o.stSNP,out.seq=50)




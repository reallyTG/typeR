library(weightedScores)


### Name: iee
### Title: INDEPENDENT ESTIMATING EQUATIONS FOR BINARY AND COUNT REGRESSION
### Aliases: iee
### Keywords: regression

### ** Examples


################################################################################
#                      read and set up data set
################################################################################
data(toenail)
# covariates
xdat<-cbind(1,toenail$treat,toenail$time,toenail$treat*toenail$time)
# response
ydat<-toenail$y
#id
id<-toenail$id
#time
tvec<-toenail$time
################################################################################
#                      select the marginal model
################################################################################
margmodel="bernoulli"
################################################################################
#                      perform the IEE method
################################################################################
i.est<-iee(xdat,ydat,margmodel)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))




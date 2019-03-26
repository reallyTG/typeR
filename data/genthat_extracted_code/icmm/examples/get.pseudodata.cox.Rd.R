library(icmm)


### Name: get.pseudodata.cox
### Title: Obtain pseudodata based on the Cox's regression model.
### Aliases: get.pseudodata.cox

### ** Examples

data(simCox)
Y<-as.matrix(simCox[,1])
event<-as.matrix(simCox[,2])
X<-as.matrix(simCox[,-(1:2)])
time<-sort(unique(Y))
ntime<-length(time)
# sum of event_i where y_i =time_k
sumevent<-rep(0, ntime)
for(j in 1:ntime)
{
  sumevent[j]<-sum(event[Y[,1]==time[j]])
}
# Obtain initial values from lasso
data(initbetaCox)
initbeta<-as.matrix(initbetaCox)
# Get Pseudodata
pseudodata<-get.pseudodata.cox(Y, X, event, initbeta, time, ntime, sumevent)
z<-pseudodata$z
sigma<-sqrt(pseudodata$sigma2)




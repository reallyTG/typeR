library(GPSCDF)


### Name: GPSCDF
### Title: Generalized Propensity Score Cumulative Distribution Function
###   (GPS-CDF)
### Aliases: GPSCDF

### ** Examples



### Example: Create data example
N<- 100

set.seed(18201) # make sure data is repeatable
Sigma <- matrix(.2,4,4)
diag(Sigma) <- 1
data<-matrix(0, nrow=N, ncol=6,dimnames=list(c(1:N),
      c("Y","trt",paste("X",c(1:4),sep=""))))
data[,3:6]<-matrix(MASS::mvrnorm(N, mu=rep(0, 4), Sigma,
      empirical = FALSE) , nrow=N, ncol = 4)

dat<-as.data.frame(data)


#Create Treatment Variable
tlogits<-matrix(0,nrow=N,ncol=2)
tprobs<-matrix(0,nrow=N,ncol=3)

alphas<-c(0.25, 0.3)
strongbetas<-c(0.7, 0.4)
modbetas<-c(0.2, 0.3)

for(j in 1:2){
  tlogits[,j]<- alphas[j] + strongbetas[j]*dat$X1 + strongbetas[j]*dat$X2+
                modbetas[j]*dat$X3 + modbetas[j]*dat$X4
}

for(j in 1:2){
  tprobs[,j]<- exp(tlogits[,j])/(1 + exp(tlogits[,1]) + exp(tlogits[,2]))
  tprobs[,3]<- 1/(1 + exp(tlogits[,1]) + exp(tlogits[,2]))
}

set.seed(91187)
for(j in 1:N){
  data[j,2]<-sample(c(1:3),size=1,prob=tprobs[j,])
}


#Create Outcome Variable
ylogits<-matrix(0,nrow=N,ncol=1,dimnames=list(c(1:N),c("Logit(P(Y=1))")))
yprobs<-matrix(0,nrow=N,ncol=2,dimnames=list(c(1:N),c("P(Y=0)","P(Y=1)")))

for(j in 1:N){
  ylogits[j,1]<- -1.1 + 0.7*data[j,2] + 0.6*dat$X1[j] + 0.6*dat$X2[j] +
                 0.4*dat$X3[j] + 0.4*dat$X4[j]

  yprobs[j,2]<- 1/(1+exp(-ylogits[j,1]))

  yprobs[j,1]<- 1-yprobs[j,2]
}

set.seed(91187)
for(j in 1:N){
  data[j,1]<-sample(c(0,1),size=1,prob=yprobs[j,])
}

dat<-as.data.frame(data)


### Example: Using GPSCDF

#Create the generalized propensity score (GPS) vector using any parametric or
#nonparametric model

glm<- nnet::multinom(as.factor(trt)~ X1+ X2+ X3+ X4, data=dat)
probab<- round(predict(glm, newdata=dat, type="probs"),digits=8)
gps<-cbind(probab[,1],probab[,2],1-probab[,1]-probab[,2])


#Create scalar balancing power parameter
fit<-GPSCDF(pscores=gps)

## Not run: 
##D   fit$ppar
## End(Not run)


#Attach scalar balancing power parameter to user defined data set
fit2<-GPSCDF(pscores=gps, data=dat)

## Not run: 
##D   fit2$ppar
##D   fit2$data
## End(Not run)


### Example: Ordinal Treatment

#Stratification
fit3<-GPSCDF(pscores=gps, data=dat, stratify=TRUE, nstrat=5)

## Not run: 
##D   fit3$ppar
##D   fit3$data
##D   fit3$nstrat
##D   fit3$strata
##D 
##D   library(survival)
##D   model1<-survival::clogit(Y~as.factor(trt)+X1+X2+X3+X4+strata(strata),
##D                            data=fit3$data)
##D   summary(model1)
## End(Not run)


#Optimal Matching
fit4<- GPSCDF(pscores=gps, data=dat, trt=dat$trt, optimal=TRUE, ordinal=TRUE)

## Not run: 
##D   fit4$ppar
##D   fit4$data
##D   fit4$optmatch
##D   fit4$optdistance
##D 
##D   library(survival)
##D   model2<-survival::clogit(Y~as.factor(trt)+X1+X2+X3+X4+strata(optmatch),
##D                            data=fit4$data)
##D   summary(model2)
## End(Not run)


#Greedy Matching
fit5<- GPSCDF(pscores=gps, data=dat, trt=dat$trt, greedy=TRUE, ordinal=TRUE)

## Not run: 
##D   fit5$ppar
##D   fit5$data
##D   fit5$caliper
##D   fit5$grddata
##D   fit5$grdmatch
##D   fit5$grdydistance
##D 
##D   library(survival)
##D   model3<-survival::clogit(Y~as.factor(trt)+X1+X2+X3+X4+strata(grdmatch),
##D                            data=fit5$grddata)
##D   summary(model3)
## End(Not run)


### Example: Multinomial Treatment

#Create all K! orderings of the GPS vector
gps1<-cbind(gps[,1],gps[,2],gps[,3])
gps2<-cbind(gps[,1],gps[,3],gps[,2])
gps3<-cbind(gps[,2],gps[,1],gps[,3])
gps4<-cbind(gps[,2],gps[,3],gps[,1])
gps5<-cbind(gps[,3],gps[,1],gps[,2])
gps6<-cbind(gps[,3],gps[,2],gps[,1])

gpsarry<-array(c(gps1, gps2, gps3, gps4, gps5, gps6), dim=c(N,3,6))


#Create scalar balancing power parameters for each ordering of the GPS vector
fit6<- matrix(0,nrow=N,ncol=6,dimnames=list(c(1:N),c("ppar1","ppar2","ppar3",
              "ppar4","ppar5","ppar6")))

## Not run: 
##D for(i in 1:6){
##D   fit6[,i]<-GPSCDF(pscores=gpsarry[,,i])$ppar
##D }
##D 
##D   fit6
##D 
##D #Perform analyses (similar to ordinal examples) using each K! ordering of the
##D #GPS vector. Select ordering which achieves optimal covariate balance
##D #(i.e. minimal standardized mean difference).
## End(Not run)





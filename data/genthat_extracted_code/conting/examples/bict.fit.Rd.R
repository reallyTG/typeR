library(conting)


### Name: bict.fit
### Title: Bayesian Analysis of Incomplete Contingency Tables
### Aliases: bict.fit

### ** Examples

data(spina)
## Load spina data.

spina$z<-spina$y
spina$z[is.na(spina$y)]<-0
## Define a new variable in spina data.frame which is equal to y except where
## y is NA, in which case z=0. This is just so we can fit maximal model to the
## complete contingency table.

maximal.mod<-glm(formula=z~(S1+S2+S3+eth)^2,data=spina,x=TRUE,y=TRUE,
contrasts=list(S1="contr.sum",S2="contr.sum",S3="contr.sum",
eth="contr.sum"))
## Fit maximal model to complete contingency table.

curr.index<-formula2index(big.X=maximal.mod$x,formula=z~S1+S2+S3+eth,data=spina)
## Set up binary vector for independence model.

IP<-t(maximal.mod$x)%*%maximal.mod$x/length(maximal.mod$y)
IP[,1]<-0
IP[1,]<-0
## Set up the inverse scale matrix for the prior distribution under
## the maximal model. 

bmod<-beta_mode(X=maximal.mod$x[!is.na(spina$y),],prior="UIP",
y=maximal.mod$y[!is.na(spina$y)],IP=IP)
## Find the posterior mode under the maximal model fitted to observed cell counts.
eta.hat<-as.vector(maximal.mod$x%*%bmod)
## Find the posterior mode of the linear predictor
## under the maximal model.

set.seed(1)
## Set seed for reproducibility
test1<-bict.fit(priornum=1, missing1=(1:length(maximal.mod$y))[is.na(spina$y)],
missing2=NULL,maximal.mod=maximal.mod, IP=IP, eta.hat=eta.hat, ini.index=curr.index, 
ini.beta=bmod[curr.index==1], ini.sig=1, ini.y0=c(500,200,20),iters=10, save=0, name=NULL,
null.move.prob=0.5, a=0.001, b=0.001, progress = FALSE) 
## Run for 10 iterations starting at model defined by curr.index.
test1$MODEL
## Look at sampled model indicators. Should be:
#  [1] "7e00" "7e00" "7e00" "7e00" "7e00" "7e00" "7e00" "7e00" "7f00" "7f00"

model2index(test1$MODEL,dig=15)
## Convert these to binary indicators of the log-linear parameters.
## Will get: 

#     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11]
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7e00    1    1    1    1    1    1    0    0    0     0     0
#7f00    1    1    1    1    1    1    1    0    0     0     0
#7f00    1    1    1    1    1    1    1    0    0     0     0
#     [,12] [,13] [,14] [,15]
#7e00     0     0     0     0
#7e00     0     0     0     0
#7e00     0     0     0     0
#7e00     0     0     0     0
#7e00     0     0     0     0
#7e00     0     0     0     0
#7e00     0     0     0     0
#7e00     0     0     0     0
#7f00     0     0     0     0
#7f00     0     0     0     0





library(conting)


### Name: bcct.fit
### Title: Bayesian Analysis of Complete Contingency Tables
### Aliases: bcct.fit bcctsubset.fit

### ** Examples

data(AOH)
## Load the AOH data.

maximal.mod<-glm(formula=y~(alc+hyp+obe)^3,data=AOH,x=TRUE,y=TRUE,
contrasts=list(alc="contr.sum",hyp="contr.sum",obe="contr.sum"))
## Set up the maximal model which in this case is the saturated 
## model.

curr.index<-formula2index(big.X=maximal.mod$x,formula=y~alc+hyp+obe+hyp:obe,data=AOH)
## Set up the binary vector for the model containing all main effects and the 
## hyp:obe interaction.

IP<-t(maximal.mod$x)%*%maximal.mod$x/length(maximal.mod$y)
IP[,1]<-0
IP[1,]<-0
## Set up the inverse scale matrix for the prior distribution under
## the maximal model. 

bmod<-beta_mode(X=maximal.mod$x,prior="UIP",y=maximal.mod$y,IP=IP)
## Find the posterior mode under the maximal model

eta.hat<-as.vector(maximal.mod$x%*%bmod)
## Find the posterior mode of the linear predictor
## under the maximal model.

set.seed(1)
## Set seed for reproducibility

test1<-bcct.fit(priornum=1, maximal.mod=maximal.mod, IP=IP, eta.hat=eta.hat, 
ini.index=curr.index, ini.beta=bmod[curr.index==1], ini.sig=1, iters=5, save=0, 
name=NULL,null.move.prob=0.5, a=0.001, b=0.001, progress=TRUE) 
## Run for 5 iterations starting at model defined by curr.index.

test1$MODEL
## Look at sampled model indicators. Should be:
## [1] "fe00c0" "fe0000" "fe0000" "fe0000" "fe0000"

model2index(test1$MODEL,dig=24)
## Convert these to binary indicators of the log-linear parameters.
## Will get: 

#       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#fe00c0    1    1    1    1    1    1    1    0    0     0     0     0     0
#fe0000    1    1    1    1    1    1    1    0    0     0     0     0     0
#fe0000    1    1    1    1    1    1    1    0    0     0     0     0     0
#fe0000    1    1    1    1    1    1    1    0    0     0     0     0     0
#fe0000    1    1    1    1    1    1    1    0    0     0     0     0     0
#       [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24]
#fe00c0     0     0     0     1     1     0     0     0     0     0     0
#fe0000     0     0     0     0     0     0     0     0     0     0     0
#fe0000     0     0     0     0     0     0     0     0     0     0     0
#fe0000     0     0     0     0     0     0     0     0     0     0     0
#fe0000     0     0     0     0     0     0     0     0     0     0     0

## See how the hyp:obe interactions in columns 17 and 18 gets dropped after 
## the 1st iteration. 





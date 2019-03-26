library(conting)


### Name: iwls_mh
### Title: Iterated Weighted Least Square Metropolis Hastings Algorithm
### Aliases: iwls_mh

### ** Examples

set.seed(1)
## Set seed for reproducibility
data(AOH)
## Load AOH data

maximal.mod<-glm(y~alc+hyp+obe,family=poisson,x=TRUE,contrasts=list(alc="contr.sum",
hyp="contr.sum",obe="contr.sum"),data=AOH)
## Fit independence model to get a design matrix

IP<-t(maximal.mod$x)%*%maximal.mod$x/length(AOH$y)
IP[,1]<-0
IP[1,]<-0
## Set up inverse prior variance matrix under the UIP

## Let the current parameters be the MLE under the independence model
as.vector(coef(maximal.mod))
#[1]  2.89365105 -0.04594959 -0.07192507  0.08971628 -0.50545335  0.00818037
#[7] -0.01636074

## Update parameters using MH algorithm
iwls_mh(curr.y=AOH$y,curr.X=maximal.mod$x,curr.beta=coef(maximal.mod),iprior.var=IP)

## Will get:
#[1]  2.86468919 -0.04218623 -0.16376055  0.21656167 -0.49528676 -0.05026597
#[7]  0.02726671




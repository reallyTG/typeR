library(conting)


### Name: RJ_update
### Title: Reversible Jump Algorithm
### Aliases: RJ_update RJ_update_swap

### ** Examples

set.seed(4)
## Set seed for reproducibility
data(AOH)
## Load data
maximal.mod<-glm(y~(alc+hyp+obe)^3,family=poisson,x=TRUE,contrasts=list(alc="contr.sum",
hyp="contr.sum",obe="contr.sum"),data=AOH)
## Fit maximal model to get a design matrix

IP<-t(maximal.mod$x)%*%maximal.mod$x/length(AOH$y)
IP[,1]<-0
IP[1,]<-0
## Calculate inverse prior scale matrix under maximal model. Under the UIP this
## is the inverse prior variance matrix. Under the SBH prior, we need to divide
## this matrix by the current value of SIG.

bmod<-beta_mode(X=maximal.mod$x,y=AOH$y,IP=IP)
## Find posterior mode under maximal model with UIP
eta.hat<-as.vector(maximal.mod$x%*%bmod)
## Find posterior mode of linear predictor.

curr.index<-formula2index(big.X=maximal.mod$x,formula=y~alc+hyp+obe+alc:hyp,data=AOH)
## Calculate index for current model including alc:hyp interaction
curr.index
## Print out current index
#[1] 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0

pm<-prop_mod(curr.index=curr.index,data=AOH,maximal.mod=maximal.mod)
## Propose a model
p2<-(1-pm$null.move.prob)/pm$total.choices
p2
## Calculate probability of proposing proposed model from current model
#[1] 0.1666667

prop.index<-pm$new.index
prop.index
## Assign and print out proposal index
# [1] 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

dm<-prop_mod(curr.index=prop.index,data=AOH,maximal.mod=maximal.mod,null.move.prob=0)
p1<-(1-pm$null.move.prob)/dm$total.choices
p1
## Calculate probability of proposing current model from proposed model
#[1] 0.1666667

RJ_update(prop.index=prop.index,curr.index=curr.index,
curr.beta=coef(maximal.mod)[curr.index==1],eta.hat=eta.hat,curr.y=AOH$y,big.X=maximal.mod$x,
proposal.probs=c(p1,p2),
i.prop.prior.var=IP[prop.index==1,prop.index==1],
i.curr.prior.var=IP[curr.index==1,curr.index==1])

## Do one iteration of reversible jump algorithm. Will get:

#$new.beta
#(Intercept)        alc1        alc2        alc3        hyp1        obe1 
# 2.87128918 -0.07098006 -0.07221330  0.08748803 -0.51899802 -0.07855115 
#       obe2 
#-0.02474727 
#
#$new.index
# [1] 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0





library(NBDesign)


### Name: negint2
### Title: A utility functon to calculate the mean exposure under different
###   scenarios
### Aliases: negint2
### Keywords: piecewise exponential piecewise uniform variable follow-up

### ** Examples

##calculating the exposure for type 4 follow-up
exp4=negint2(ux=0.5,fixedfu=1,type=2,u=c(0.5,0.5,1),ut=c(0.5,1.0,1.5),
  tfix=2.0,maxfu=1.0,tchange=c(0,0.5,1),
  ratec=c(0.15,0.15,0.15),eps=1.0e-03)
#mean exposure            
meanexp=exp4$tt
#var exposure
varexp=exp4$vt
c(meanexp,sqrt(varexp))
#mean of (ux*t)/(1+ux*t)
meanuxt=exp4$mt




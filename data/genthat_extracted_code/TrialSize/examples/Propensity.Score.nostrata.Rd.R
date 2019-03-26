library(TrialSize)


### Name: Propensity.Score.nostrata
### Title: Propensity Score ignoring strata
### Aliases: Propensity.Score.nostrata
### Keywords: ~kwd1 ~kwd2

### ** Examples


a=c(0.15,0.15,0.2,0.25,0.25);
b=c(0.4,0.4,0.5,0.6,0.6);
p1=c(0.5,0.6,0.7,0.8,0.9);

Example.15.2.3.2<-Propensity.Score.nostrata(alpha=0.05,beta=0.2,J=5,a,b,p1,phi=2)
Example.15.2.3.2
# 1151





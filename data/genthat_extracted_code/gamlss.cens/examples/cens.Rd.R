library(gamlss.cens)


### Name: cens
### Title: Function to Fit Censored Data Using a gamlss.family Distribution
### Aliases: cens
### Keywords: distribution regression

### ** Examples

# comparing output with the survreg() of package survival
library(gamlss.dist)
library(survival)
#--------------------------------------------------------------------
# right censoring example 
# example from survreg() 
# fitting the exponential distribution
mexp<-survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='exponential')
gexp<-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
             family=cens(EXP), c.crit=0.00001)
if(abs(-2*mexp$loglik[2]-deviance(gexp))>0.001) 
         stop(paste("descrepancies in exponential models")) 
if(sum(coef(mexp)-coef(gexp))>0.001) 
        warning(paste("descrepancies in coef in exponential models")) 
summary(mexp)
gen.cens(EXP)
summary(gexp)
# fitting different distributions
# weibull 
mwei <-survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='weibull')
gwei<-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
             family=cens(WEI, delta=c(0.0001,0.0001)), c.crit=0.00001)
if(abs(-2*mwei$loglik[2]-deviance(gwei))>0.005) 
        stop(paste("descrepancies in deviance in WEI")) 
scoef <- sum(coef(mwei)-coef(gwei))
if(abs(scoef)>0.005) 
         warning(cat("descrepancies in coef in WEI of ", scoef, "\n")) 
# WEI3 is weibull parametrised with mu as the mean
gwei3 <- gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
                 family=cens(WEI3)) 
# log normal
mlogno <-survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, 
                  dist='lognormal')
glogno<-gamlss(Surv(futime, fustat) ~ ecog.ps + rx, data=ovarian, 
                family=cens(LOGNO, delta=c(0.001,0.001)), c.cyc=0.00001)
if(abs(-2*mlogno$loglik[2]-deviance(glogno))>0.005) 
          stop(paste("descrepancies in deviance in LOGNO")) 
coef(mlogno);coef(glogno) 
#-------------------------------------------------------------------- 
# now interval response variable 
data(lip)
with(lip, y)
mg1<-survreg(y ~ poly(Tem,2)+poly(pH,2)+poly(aw,2), data=lip, dist="weibull")
gg1<- gamlss(y ~ poly(Tem,2)+poly(pH,2)+poly(aw,2), data=lip, 
      family=cens(WEI,type="interval"), c.crit=0.00001, n.cyc=200, trace=FALSE)
summary(mg1)
gen.cens(WEI,type="interval")
summary(gg1)
#--------------------------------------------------------------------
# now fitting discretised continuous distribution to count data
# fitting discretised Gamma
data(species)
# first generate the distributions
gen.cens(GA, type="interval")
gen.cens(IG, type="interval")
 mGA<-gamlss(Surv(fish,fish+1,type= "interval2")~log(lake)+I(log(lake)^2), 
       sigma.fo=~log(lake), data=species, family=GAic)
# fitting discretised inverse Gaussian
 mIG<-gamlss(Surv(fish,fish+1,type= "interval2")~log(lake)+I(log(lake)^2), 
      sigma.fo=~log(lake), data=species, family=IGic)
AIC(mGA,mIG)
plot(fish~log(lake), data=species)
with(species, lines(log(lake)[order(lake)], fitted(mIG)[order(lake)]))             
#--------------------------------------------------------------------




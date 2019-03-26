library(riskRegression)


### Name: rsquared
### Title: Explained variation for settings with binary, survival and
###   competing risk outcome
### Aliases: rsquared rsquared.default rsquared.glm rsquared.coxph
###   rsquared.CauseSpecificCox IPA IPA.default IPA.glm IPA.coxph
###   IPA.CauseSpecificCox

### ** Examples


# binary outcome
library(lava)
set.seed(18)
learndat <- sampleData(48,outcome="binary")
lr1 = glm(Y~X1+X2+X7+X9,data=learndat,family=binomial)
rsquared(lr1)

## validation data
valdat=sampleData(94,outcome="binary")
rsquared(lr1,newdata=valdat)

## predicted risks externally given
p1=predictRisk(lr1,newdata=valdat)
rsquared(p1,formula=Y~1,valdat)

# survival
library(survival)
data(pbc)
pbc=na.omit(pbc)
pbctest=(1:NROW(pbc)) %in% sample(1:NROW(pbc),size=.632*NROW(pbc))
pbclearn=pbc[pbctest,]
cox1= coxph(Surv(time,status!=0)~age+sex+log(bili)+log(albumin)+log(protime),
      data=pbclearn,x=TRUE)

## same data
rsquared(cox1,formula=Surv(time,status!=0)~1,times=1000)

## validation data
pbcval=pbc[!pbctest,]
rsquared(cox1,formula=Surv(time,status!=0)~1,newdata=pbcval,times=1000)

## predicted risks externally given
p2=predictRisk(cox1,newdata=pbcval,times=1000)
rsquared(cox1,formula=Surv(time,status!=0)~1,newdata=pbcval,times=1000)
 
# competing risks
data(Melanoma)
Melanomatest=(1:NROW(Melanoma)) %in% sample(1:NROW(Melanoma),size=.632*NROW(Melanoma))
Melanomalearn=Melanoma[Melanomatest,]
fit1 <- CSC(list(Hist(time,status)~sex,
                 Hist(time,status)~invasion+epicel+age),
                 data=Melanoma)
rsquared(fit1,times=1000,cause=2)

## validation data
Melanomaval=Melanoma[!Melanomatest,]
rsquared(fit1,formula=Hist(time,status)~1,newdata=Melanomaval,times=1000)

## predicted risks externally given
p3= predictRisk(fit1,cause=1,newdata=Melanomaval,times=1000)
rsquared(p3,formula=Hist(time,status)~1,cause=1,newdata=Melanomaval,times=1000)
 




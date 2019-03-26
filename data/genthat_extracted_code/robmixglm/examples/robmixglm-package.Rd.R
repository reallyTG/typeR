library(robmixglm)


### Name: robmixglm-package
### Title: Fits random effects meta-analysis models including robust models
### Aliases: robmixglm-package

### ** Examples

## No test: 
# animal brain vs body weight
library(MASS)
data(Animals)
Animals$logbrain <- log(Animals$brain)
Animals$logbody <- log(Animals$body)
lm1 <- lm(logbrain~logbody,data=Animals)
lm2 <- robmixglm(logbrain~logbody,data=Animals)
plot(Animals$logbody,Animals$logbrain)
abline(lm1,col="red")
abline(lm2,col="green")
plot(outlierProbs(lm2))
outlierTest(lm2,showProgress=FALSE)

# Forbes data on relationship between atmospheric pressure and boiling point of water
library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(100*log10(pres)~bp,data=MASS::forbes)
summary(forbes.robustmix)
plot(outlierProbs(forbes.robustmix))
outlierTest(forbes.robustmix,showProgress=FALSE)

# Hawkins' data
library(forward)
data(hawkins)
hawkins.robustmix <- robmixglm(y~x1+x2+x3+x4+x5+x6+x7+x8,
    data=hawkins)
summary(hawkins.robustmix)
plot(outlierProbs(hawkins.robustmix))
outlierTest(hawkins.robustmix,showProgress=FALSE)

# diabetes
diabdata.robustmix <- robmixglm(glyhb~age+gender+bmi+waisthip+frame,
    data=diabdata)
summary(diabdata.robustmix)
# this will take about 5-10 minutes
diabdata.step <- step(diabdata.robustmix,glyhb~age+gender+bmi+waisthip+frame)
summary(diabdata.step)
plot(outlierProbs(diabdata.step))
outlierTest(diabdata.step,showProgress=FALSE)

# carrot damage
library(robustbase)
data(carrots)
carrots.robustmix <- robmixglm(cbind(success,total-success)~logdose+factor(block),
     family="binomial",data=carrots)
summary(carrots.robustmix)
plot(outlierProbs(carrots.robustmix))
outlierTest(carrots.robustmix,showProgress=FALSE)

# train derailment
library(forward)
data(derailme)
derailme$cYear <- derailme$Year-mean(derailme$Year)
derailme$TrainKm100 <- derailme$TrainKm*100.0
derailme.robustmix <- robmixglm(y~cYear+factor(Type),offset=log(TrainKm100),family="truncpoisson",
       quadpoints=51, data=derailme)
summary(derailme.robustmix)
plot(outlierProbs(derailme.robustmix))
outlierTest(derailme.robustmix,showProgress=FALSE)
       
# hospital costs
hospcosts.robustmix <- robmixglm(costs~adm+age+dest+ins+loglos+sex,family="gamma",data=hospcosts)
summary(hospcosts.robustmix)
plot(outlierProbs(hospcosts.robustmix))
outlierTest(hospcosts.robustmix,showProgress=FALSE)
## End(No test)




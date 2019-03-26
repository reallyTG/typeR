library(logistf)


### Name: logistf
### Title: Firth's Bias-Reduced Logistic Regression
### Aliases: logistf
### Keywords: models regression

### ** Examples

data(sex2)
fit<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sex2)
summary(fit)
nobs(fit)
drop1(fit)
plot(profile(fit,variable="dia"))

extractAIC(fit)

fit1<-update(fit, case ~ age+oc+vic+vicl+vis)
extractAIC(fit1)
anova(fit,fit1)


data(sexagg)
fit2<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sexagg, weights=COUNT)
summary(fit2)


# simulated SNP example
# not run
set.seed(72341)
snpdata<-rbind(
    matrix(rbinom(2000,2,runif(2000)*0.3),100,20),
    matrix(rbinom(2000,2,runif(2000)*0.5),100,20))
colnames(snpdata)<-paste("SNP",1:20,"_",sep="")
snpdata<-as.data.frame(snpdata)
for(i in 1:20) snpdata[,i]<-as.factor(snpdata[,i])
snpdata$case<-c(rep(0,100),rep(1,100))


fitsnp<-logistf(data=snpdata, formula=case~1, pl=FALSE)
add1(fitsnp)
fitf<-forward(fitsnp)
fitf





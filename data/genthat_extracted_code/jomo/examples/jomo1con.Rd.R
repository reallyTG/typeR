library(jomo)


### Name: jomo1con
### Title: JM Imputation of single level data with continuous variables
###   only
### Aliases: jomo1con

### ** Examples



attach(sldata)

#We define all the inputs:

Y=data.frame(measure,age)
X=data.frame(rep(1,300),sex)
beta.start<-matrix(0,2,2)
l1cov.start<-diag(1,2)
l1cov.prior=diag(1,2);
nburn=as.integer(200);
nbetween=as.integer(200);
nimp=as.integer(5);

# Then we run he function:

imp<-jomo1con(Y,X,beta.start,l1cov.start,l1cov.prior,nburn,nbetween,nimp)

cat("Original value was missing(",imp[1,1],"), imputed value:", imp[301,1])

#Finally we can analyse the imputed datasets and combine results:

estimates<-rep(0,5)
ses<-rep(0,5)
estimates2<-rep(0,5)
ses2<-rep(0,5)
for (i in 1:5) {
  dat<-imp[imp$Imputation==i,]
  fit<-lm(measure~age+sex,data=dat)
  estimates[i]<-coef(summary(fit))[2,1]
  ses[i]<-coef(summary(fit))[2,2]
  estimates2[i]<-coef(summary(fit))[3,1]
  ses2[i]<-coef(summary(fit))[3,2]
}

#Here we use the BaBooN library to apply Rubins rules:

#library("BaBooN")
#MI.inference(estimates, ses^2)
#MI.inference(estimates2, ses2^2)





library(glmm)


### Name: glmm
### Title: Fitting Generalized Linear Mixed Models using MCML
### Aliases: glmm
### Keywords: generalized linear mixed model Monte Carlo maximum likelihood
###   likelihood approximation

### ** Examples

#First, using the basic Booth and Hobert dataset
#to fit a glmm with a logistic link, one variance component,
#one fixed effect, and an intercept of 0. The Monte Carlo
#sample size is 100 to save time.
library(glmm)
data(BoothHobert)
set.seed(1234)
## No test: 
mod.mcml1 <- glmm(y~0+x1, list(y~0+z1), varcomps.names=c("z1"), data=BoothHobert,
## End(No test)
## No test: 
family.glmm=bernoulli.glmm, m=100, doPQL=TRUE, cluster=clust)
## End(No test)
## No test: 
mod.mcml1$beta
## End(No test)
## No test: 
mod.mcml1$nu
## End(No test)
## No test: 
summary(mod.mcml1)
## End(No test)
## No test: 
coef(mod.mcml1)
## End(No test)

#Next, a model setting two variance components equal.
data(Booth2)
set.seed(1234)
## No test: 
mod.mcml3<-glmm(y~0+x1, list(y~0+z1,~0+z2), varcomps.names=c("z"), 
## End(No test)
## No test: 
varcomps.equal=c(1,1), data=Booth2, family.glmm=bernoulli.glmm, m=100)
## End(No test)
## No test: 
summary(mod.mcml3)
## End(No test)

#Now, a model with crossed random effects. There are two distinct
#variance components. To get more accurate answers for this model,
#use a larger Monte Carlo sample size, such as m=10^4 or 10^5
#and doPQL=TRUE.
set.seed(1234)
data(salamander)
m<-100
## No test: 
sal<-glmm(Mate~0+Cross,random=list(~0+Female,~0+Male),varcomps.names=c("F","M"),
## End(No test)
## No test: 
data=salamander,family.glmm=bernoulli.glmm,m=m,debug=TRUE,cluster=clust)
## End(No test)
## No test: 
summary(sal)
## End(No test)

#The above model (sal) can be redone with binomial.glmm
set.seed(1234)
## No test: 
sal<-glmm(cbind(Mate,1-Mate)~0+Cross,random=list(~0+Female,~0+Male),varcomps.names=c("F","M"),
## End(No test)
## No test: 
data=salamander,family.glmm=binomial.glmm,m=m,debug=TRUE,cluster=clust)
## End(No test)





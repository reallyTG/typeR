library(glmm)
data(BoothHobert)

#test whether we get same answers with Binomial and Bernoulli families (for bern data)

#Bin and Ber, with response as a vector
clust <- makeCluster(2)
set.seed(123)
mod.mcml1<-glmm(y~0+x1, list(y~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=bernoulli.glmm, m=10, doPQL=TRUE, cluster=clust)
set.seed(123)
mod.mcml2<-glmm(y~0+x1, list(y~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=binomial.glmm, m=10, doPQL=TRUE, cluster=clust)
all.equal(coef(mod.mcml1),coef(mod.mcml2))
all.equal(varcomps(mod.mcml1),varcomps(mod.mcml2))

##now do Bin with cbind(successes, failures)
Bigy<-cbind(BoothHobert$y,1-BoothHobert$y)
#  Bin with cbind(successes, failures)
set.seed(123)
mod.mcml6<-glmm(Bigy~0+x1, list(Bigy~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=binomial.glmm, m=10, doPQL=TRUE, cluster=clust)
all.equal(coef(mod.mcml1),coef(mod.mcml6))
all.equal(varcomps(mod.mcml1),varcomps(mod.mcml6))

#another Bin and Ber, with response as a vector
#set.seed(123)
#mod.mcml3<-glmm(y~0+x1, list(y~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=bernoulli.glmm, m=10, doPQL=FALSE)
#set.seed(123)
#mod.mcml4<-glmm(y~0+x1, list(y~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=binomial.glmm, m=10, doPQL=FALSE)
#all.equal(coef(mod.mcml3),coef(mod.mcml4))
#all.equal(varcomps(mod.mcml3),varcomps(mod.mcml4))


#set.seed(123)
#mod.mcml5<-glmm(Bigy~0+x1, list(Bigy~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=binomial.glmm, m=10, doPQL=FALSE)
#all.equal(coef(mod.mcml3),coef(mod.mcml5))
#all.equal(varcomps(mod.mcml3),varcomps(mod.mcml5))



#one more with another data set to be safe
#data(salamander)
#set.seed(1234)
#sal<-glmm(Mate~Cross,random=list(~0+Female,~0+Male),varcomps.names=c("F","M"), data=salamander,family.glmm=bernoulli.glmm,m=10,debug=TRUE,doPQL=TRUE)
#set.seed(1234)
#sal2<-glmm(cbind(Mate,1-Mate)~Cross,random=list(~0+Female,~0+Male),varcomps.names=c("F","M"), data=salamander,family.glmm=binomial.glmm,m=10,debug=TRUE,doPQL=TRUE)
#all.equal(coef(sal),coef(sal2))
#all.equal(varcomps(sal),varcomps(sal2))

stopCluster(clust)
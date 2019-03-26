library(mmm2)


### Name: mmm2
### Title: Function to fit multivariate marginal models with shared
###   regression parameters
### Aliases: mmm2
### Keywords: generalized estimationg equations multivariate marginal
###   models

### ** Examples

## binary data application
data(Kenya_morbidity)
fit1 <- mmm2(cbind(poor_appetite, headache) ~ visit_num + age_at_onset + boy + 
             as.factor(treatment), id = ~ ID, data = Kenya_morbidity, interaction = 1 : 6, 
             family = binomial(link = logit), corstr = "unstructured")
summary(fit1)$coef

## count data application
data(mlcd)
fit2<-mmm2(formula=cbind(mlcd$resp1,mlcd$resp2)~mlcd$X+mlcd$time+
mlcd$X.time,id=mlcd$ID,rtype=TRUE,interaction=1:3,family=poisson,corstr="unstructured")
summary(fit2)$coef

## continuous data application
data(mlgd)
fit3<-mmm2(formula=cbind(mlgd$resp1,mlgd$resp2)~mlgd$X+mlgd$time+
mlgd$X.time,id=mlgd$ID,rtype=TRUE,interaction=1:3,family=gaussian,corstr="unstructured")
summary(fit3)$coef




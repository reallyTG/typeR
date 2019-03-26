library(BMA)


### Name: bic.surv
### Title: Bayesian Model Averaging for Survival models.
### Aliases: bic.surv bic.surv.data.frame bic.surv.matrix bic.surv.formula
### Keywords: regression survival

### ** Examples


## Not run: 
##D ## veteran data
##D library(survival)
##D data(veteran)
##D 
##D test.bic.surv<- bic.surv(Surv(time,status) ~ ., data = veteran, 
##D                          factor.type = TRUE)
##D summary(test.bic.surv, conditional=FALSE, digits=2)
##D plot(test.bic.surv)
##D 
##D imageplot.bma(test.bic.surv)
## End(Not run)


## pbc data
data(pbc)
x<- pbc[1:312,]
surv.t<- x$time
cens<- as.numeric((x$status == 2))

x<- x[,c("age", "albumin", "alk.phos", "ascites", "bili", "edema", 
         "hepato", "platelet", "protime", "sex", "ast", "spiders", 
         "stage", "trt", "copper")]

## Not run: 
##D x$bili<- log(x$bili)
##D x$alb<- log(x$alb)
##D x$protime<- log(x$protime)
##D x$copper<- log(x$copper)
##D x$ast<- log(x$ast)
##D 
##D test.bic.surv<- bic.surv(x, surv.t, cens, 
##D                          factor.type=FALSE, strict=FALSE)
##D summary(test.bic.surv)
## End(Not run)





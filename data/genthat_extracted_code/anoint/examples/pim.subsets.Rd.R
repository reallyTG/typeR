library(anoint)


### Name: pim.subsets
### Title: Perform all subsets proportional interactions modeling
### Aliases: pim.subsets

### ** Examples


set.seed(11903)

# NO INTERACTION CONDITION, LOGISTIC MODEL

null.interaction <- data.anoint(
                             alpha = c(log(.5),log(.5*.75)),
                             beta = log(c(1.5,2)),
                             gamma = rep(1,2),
                             mean = c(0,0),
                             vcov = diag(2),
                             type="survival", n = 500
                             )

head(null.interaction)

pim.subsets(Surv(y, event)~V1+V2,trt="trt",data=null.interaction,family="coxph")


# PROPORTIONAL INTERACTION WITH THREE COVARIATES AND BINARY OUTCOME

pim.interaction <- data.anoint(
			     n = 5000,
                             alpha = c(log(.2/.8),log(.2*.75/(1-.2*.75))),
                             beta = rep(log(.8),3),
                             gamma = rep(1.5,3),
                             mean = c(0,0,0),
                             vcov = diag(3),
                             type="binomial"
                             )

pim.subsets(y~V1+V2+V3,trt="trt",data=pim.interaction,family="binomial")




library(anoint)


### Name: anoint.subgroups
### Title: Perform one-by-one subgroup analyses
### Aliases: anoint.subgroups

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

anoint.subgroups(Surv(y, event)~V1+V2,trt="trt",data=null.interaction,family="coxph")


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

anoint.subgroups(y~V1+V2+V3,trt="trt",data=pim.interaction,family="binomial")




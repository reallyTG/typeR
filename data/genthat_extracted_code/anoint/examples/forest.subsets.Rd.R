library(anoint)


### Name: forest.subsets
### Title: Subsets forest plot for proportional interactions models
### Aliases: forest.subsets

### ** Examples


set.seed(11903)

# NO INTERACTION CONDITION, LOGISTIC MODEL
# SUPPOSE 5 HYPOTHESIZED EFFECT MODIFIERS

null.interaction <- data.anoint(
                             alpha = c(log(.5),log(.5*.75)),
                             beta = log(rep(1.5,5)),
                             gamma = rep(1,5),
                             mean = rep(0,5),
                             vcov = diag(5),
                             type="survival", n = 500
                             )

head(null.interaction)

fit <- pim.subsets(Surv(y, event)~V1+V2+V3+V4+V5,trt="trt",
		data=null.interaction,family="coxph")

forest.subsets(fit)




library(anoint)


### Name: pim
### Title: Fit proportional interaction model
### Aliases: pim

### ** Examples


set.seed(1115)

pim.interaction <- data.anoint(
                             alpha = c(log(.2/.8),log(.2*.75/(1-.2*.75))),
                             beta = log(c(1.25,1.5)),
                             gamma = rep(1.2,2),
                             mean = c(0,0),
                             vcov = diag(2),
                             type="binomial", n = 500
                             )


object <- anoint(y~(V1+V2)*trt,data=pim.interaction,family="binomial")

object

fit <- pim(object)

fit

summary(fit)

# EXAMPLE WITH BOOTSTRAP 
fit <- pim(object, n=50)
summary(fit)
confint(fit)




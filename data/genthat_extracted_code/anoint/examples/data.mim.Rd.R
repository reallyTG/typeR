library(anoint)


### Name: data.anoint
### Title: Generate a clinical trial data set under a specified multiple
###   interaction model
### Aliases: data.anoint

### ** Examples


null.interaction <- data.anoint(
                             alpha = c(log(.2/.8),log(.2*.75/(1-.2*.75))),
                             beta = c(1.5,2),
                             gamma = rep(1,2),
                             mean = c(0,0),
                             vcov = diag(2),
                             type="binomial"
                             )

fit <- glm(y~(.)*trt,data=null.interaction,family="binomial")

summary(fit)


null.interaction <- data.anoint(
                             alpha = c(log(.5),log(.5*.75)),
                             beta = c(1.5,2),
                             gamma = rep(1,2),
                             mean = c(0,0),
                             vcov = diag(2),
                             type="survival",
                             event = .7
                             )

fit <- coxph(Surv(y, event)~(.)*trt,data=null.interaction)

summary(fit)




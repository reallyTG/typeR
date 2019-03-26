library(pensim)


### Name: create.data
### Title: simulate correlated predictors with time-to-event or binary
###   outcome
### Aliases: create.data
### Keywords: datagen survival

### ** Examples

##binary outcome example
set.seed(9)
x <- create.data(nvars=c(15, 5), cors=c(0, 0.8), associations=c(0, 2), 
                 firstonly=c(TRUE, TRUE), nsamples=50, response="binary", 
		 logisticintercept=0.5)
summary(x)
x$summary
model <- glm(outcome ~ .,  data=x$data, family=binomial)
summary(model)
dat <- t(as.matrix(x$data[, -match("outcome", colnames(x$data))]))
heatmap(dat, ColSideColors=ifelse(x$data$outcome==0, "black", "white"))

##censored survival outcome example:
set.seed(1)
x <- create.data(nvars=c(15, 5), 
                 cors=c(0, 0.8), 
                 associations=c(0, 2), 
                 firstonly=c(TRUE, TRUE), 
                 nsamples=50, 
                 censoring=c(2, 10), 
                 response="timetoevent")
sum(x$data$cens==0)/nrow(x$data)  #34 percent censoring

library(survival)
surv.obj <- Surv(x$data$time, x$data$cens)
plot(survfit(surv.obj~1), ylab="Survival probability", xlab="time")




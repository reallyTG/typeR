library(BCgee)


### Name: BCgee
### Title: Function to obtain bias-corrected estimates for regression
###   coefficients of a marginal model estimated with generalized
###   estimating equations.
### Aliases: BCgee print.BCgee summary.BCgee print.summary.BCgee

### ** Examples

##Cerebrovascular deficiency example
##see page 153 of Diggle, P., Liang, K.-Y., Zeger, S. (1994). Analysis of longitudinal data. 
data(cereb)

if(require(gee)){
fit <- gee(y ~ Period+Drug, id = id, data = cereb, family = binomial(logit), 
corstr = "exchangeable")
fitbc <- BCgee(fit)
##compare coefficients, standard errors, and Wald statistics
summary(fit)$coefficients
summary(fitbc)$coefficients
##compare residuals
fit$residuals
fitbc$residuals
}

##Seizure example from geepack
##see page 166 of Diggle, P., Liang, K.-Y., Zeger, S. (1994). Analysis of longitudinal data. 
data(seizure)
seiz.l <- reshape(seizure,
          varying=list(c("base","y1", "y2", "y3", "y4")),
          v.names="y", times=0:4, direction="long")
     seiz.l <- seiz.l[order(seiz.l$id, seiz.l$time),]
     seiz.l$t <- ifelse(seiz.l$time == 0, 8, 2)
     seiz.l$x <- ifelse(seiz.l$time == 0, 0, 1)


if(require(gee)){
fit <- gee(y ~ offset(log(t)) + x + trt + x:trt, id = id, data=seiz.l, corstr="exchangeable", 
family=poisson(log))
fitbc <- BCgee(fit)
##compare coefficients, standard errors, and Wald statistics
summary(fit)$coefficients
summary(fitbc)$coefficients
##compare residuals
fit$residuals
fitbc$residuals
}




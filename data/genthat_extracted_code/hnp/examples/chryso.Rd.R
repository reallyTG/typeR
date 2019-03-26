library(hnp)


### Name: chryso
### Title: _Chrysoperla externa_ mortality data
### Aliases: chryso
### Keywords: datasets

### ** Examples

data(chryso)

# fit model using conc levels both on log-scale and
# as a factor to produce simple analysis of deviance
model <- glm(cbind(dead, alive) ~  log.conc + factor(conc),
             family=binomial, data=chryso)
anova(model, test="Chisq")
# test adequacy of factor model using deviance and X2
1-pchisq(deviance(model), df.residual(model))
(X2 <- sum(residuals(model, type="pearson")^2))
1-pchisq(X2, df.residual(model))

model1 <- glm(cbind(dead, alive) ~ log.conc,
              family=binomial, data=chryso)
par(mfrow=c(1,2), cex=1.4)
with(chryso, plot(jitter(log.conc), dead/(dead+alive),
                  ylab="Proportion dead", xlab="log(conc+1)"))
x <- seq(0, 8.7, .1)
pr <- predict(model1, data.frame(log.conc=x), ty="response")
lines(x, pr)
# half-normal plot
hnp(model1, xlab="Half-normal scores",
    ylab="Deviance residuals", pch=4)

require(MASS)
dose.p(model1, p=.10)

logLC10 <- dose.p(model1, p=.10)
LC10 <- exp(logLC10[[1]]) - 1

#95% CI on log-dose scale using transformation
c(logLC10[1]-2*attr(logLC10,'SE'),
  logLC10[1]+2*attr(logLC10,'SE'))

#95% CI on dose scale using transformation
c(exp(logLC10[1]-2*attr(logLC10,'SE'))-1,
  exp(logLC10[1]+2*attr(logLC10,'SE'))-1)

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)




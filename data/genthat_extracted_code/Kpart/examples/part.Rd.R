library(Kpart)


### Name: part
### Title: Fits a linear model based on spline terms with additional
###   support for other independent variables.
### Aliases: part
### Keywords: regression

### ** Examples


## for simple spline model.
data(LakeHuron)
d <- data.frame(seq(1875, 1972, 1), LakeHuron)
names(d) <- c('date', 'lh')
fit <- part(d = d, outcomeVariable = 'lh', splineTerm = 'date', K = 20)
fit
plot(d$date, d$lh)
lines(d$date, fit$fits, col = 'red')


## multivariate
data(freeny)
freeny$time <- as.numeric(rownames(freeny))
fit <- part(d = freeny, outcomeVariable = 'y',
    splineTerm = 'time', additionalVars = c('market.potential', 'income.level'), K =2)
fit$coefs




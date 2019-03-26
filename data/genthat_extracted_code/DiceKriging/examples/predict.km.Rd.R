library(DiceKriging)


### Name: predict
### Title: Predict values and confidence intervals at newdata for a km
###   object
### Aliases: predict predict.km predict,km-method
### Keywords: models methods

### ** Examples

# ------------
# a 1D example
# ------------

x <- c(0, 0.4, 0.6, 0.8, 1)
y <- c(-0.3, 0, 0, 0.5, 0.9)

formula <- y~x   # try also   y~1  and  y~x+I(x^2)

model <- km(formula=formula, design=data.frame(x=x), response=data.frame(y=y), 
            covtype="matern5_2")

tmin <- -0.5; tmax <- 2.5
t <- seq(from=tmin, to=tmax, by=0.005)
color <- list(SK="black", UK="blue")

# Results with Universal Kriging formulae (mean and and 95% intervals)
p.UK <- predict(model, newdata=data.frame(x=t), type="UK")
plot(t, p.UK$mean, type="l", ylim=c(min(p.UK$lower95),max(p.UK$upper95)), 
                xlab="x", ylab="y")
lines(t, p.UK$trend, col="violet", lty=2)
lines(t, p.UK$lower95, col=color$UK, lty=2)
lines(t, p.UK$upper95, col=color$UK, lty=2)
points(x, y, col="red", pch=19)
abline(h=0)

# Results with Simple Kriging (SK) formula. The difference between the width of
# SK and UK intervals are due to the estimation error of the trend parameters 
# (but not to the range parameters, not taken into account in the UK formulae).
p.SK <- predict(model, newdata=data.frame(x=t), type="SK")
lines(t, p.SK$mean, type="l", ylim=c(-7,7), xlab="x", ylab="y")
lines(t, p.SK$lower95, col=color$SK, lty=2)
lines(t, p.SK$upper95, col=color$SK, lty=2)
points(x, y, col="red", pch=19)
abline(h=0)

legend.text <- c("Universal Kriging (UK)", "Simple Kriging (SK)")
legend(x=tmin, y=max(p.UK$upper), legend=legend.text, 
       text.col=c(color$UK, color$SK), col=c(color$UK, color$SK), 
       lty=3, bg="white")


# ---------------------------------------------------------------------------------
# a 1D example (following)- COMPARISON with the PREDICTION INTERVALS for REGRESSION
# ---------------------------------------------------------------------------------
# There are two interesting cases: 
# *  When the range parameter is near 0 ; Then the intervals should be nearly 
#    the same for universal kriging (when bias.correct=TRUE, see above) as for regression. 
#    This is because the uncertainty around the range parameter is not taken into account 
#    in the Universal Kriging formula.
# *  Where the predicted sites are "far" (relatively to the spatial correlation) 
#    from the design points ; in this case, the kriging intervals are not equal 
#    but nearly proportional to the regression ones, since the variance estimate 
#    for regression is not the same than for kriging (that depends on the 
#    range estimate)

x <- c(0, 0.4, 0.6, 0.8, 1)
y <- c(-0.3, 0, 0, 0.5, 0.9)

formula <- y~x   # try also   y~1  and  y~x+I(x^2)
upper <- 0.05    # this is to get something near to the regression case. 
                 # Try also upper=1 (or larger) to get usual results.

model <- km(formula=formula, design=data.frame(x=x), response=data.frame(y=y), 
               covtype="matern5_2", upper=upper)

tmin <- -0.5; tmax <- 2.5
t <- seq(from=tmin, to=tmax, by=0.005)
color <- list(SK="black", UK="blue", REG="red")

# Results with Universal Kriging formulae (mean and and 95% intervals)
p.UK <- predict(model, newdata=data.frame(x=t), type="UK", bias.correct=TRUE)
plot(t, p.UK$mean, type="l", ylim=c(min(p.UK$lower95),max(p.UK$upper95)), 
                   xlab="x", ylab="y")
lines(t, p.UK$trend, col="violet", lty=2)
lines(t, p.UK$lower95, col=color$UK, lty=2)
lines(t, p.UK$upper95, col=color$UK, lty=2)
points(x, y, col="red", pch=19)
abline(h=0)

# Results with Simple Kriging (SK) formula. The difference between the width of
# SK and UK intervals are due to the estimation error of the trend parameters 
# (but not to the range parameters, not taken into account in the UK formulae).
p.SK <- predict(model, newdata=data.frame(x=t), type="SK")
lines(t, p.SK$mean, type="l", ylim=c(-7,7), xlab="x", ylab="y")
lines(t, p.SK$lower95, col=color$SK, lty=2)
lines(t, p.SK$upper95, col=color$SK, lty=2)
points(x, y, col="red", pch=19)
abline(h=0)

# results with regression given by lm (package stats)
m.REG <- lm(formula)
p.REG <- predict(m.REG, newdata=data.frame(x=t), interval="prediction")
lines(t, p.REG[,1], col=color$REG)
lines(t, p.REG[,2], col=color$REG, lty=2)
lines(t, p.REG[,3], col=color$REG, lty=2)

legend.text <- c("UK with bias.correct=TRUE", "SK", "Regression")
legend(x=tmin, y=max(p.UK$upper), legend=legend.text, 
       text.col=c(color$UK, color$SK, color$REG), 
       col=c(color$UK, color$SK, color$REG), lty=3, bg="white")


# ----------------------------------
# A 2D example - Branin-Hoo function
# ----------------------------------

# a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
fact.design <- expand.grid(x1=seq(0,1,length=4), x2=seq(0,1,length=4))
branin.resp <- apply(fact.design, 1, branin)

# kriging model 1 : gaussian covariance structure, no trend, 
#                   no nugget effect
m1 <- km(~1, design=fact.design, response=branin.resp, covtype="gauss")

# predicting at testdata points
testdata <- expand.grid(x1=s <- seq(0,1, length=15), x2=s)
predicted.values.model1 <- predict(m1, testdata, "UK")




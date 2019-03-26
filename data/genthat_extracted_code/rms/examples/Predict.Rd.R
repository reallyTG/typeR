library(rms)


### Name: Predict
### Title: Compute Predicted Values and Confidence Limits
### Aliases: Predict print.Predict rbind.Predict
### Keywords: models

### ** Examples

n <- 1000    # define sample size
set.seed(17) # so can reproduce the results
age            <- rnorm(n, 50, 10)
blood.pressure <- rnorm(n, 120, 15)
cholesterol    <- rnorm(n, 200, 25)
sex            <- factor(sample(c('female','male'), n,TRUE))
label(age)            <- 'Age'      # label is in Hmisc
label(cholesterol)    <- 'Total Cholesterol'
label(blood.pressure) <- 'Systolic Blood Pressure'
label(sex)            <- 'Sex'
units(cholesterol)    <- 'mg/dl'   # uses units.default in Hmisc
units(blood.pressure) <- 'mmHg'

# Specify population model for log odds that Y=1
L <- .4*(sex=='male') + .045*(age-50) +
  (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male'))
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)

ddist <- datadist(age, blood.pressure, cholesterol, sex)
options(datadist='ddist')

fit <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol,4)))
Predict(fit, age, cholesterol, np=4)
Predict(fit, age=seq(20,80,by=10), sex, conf.int=FALSE)
Predict(fit, age=seq(20,80,by=10), sex='male')  # works if datadist not used
# Get simultaneous confidence limits accounting for making 7 estimates
# Predict(fit, age=seq(20,80,by=10), sex='male', conf.type='simult')
# (this needs the multcomp package)

ddist$limits$age[2] <- 30    # make 30 the reference value for age
# Could also do: ddist$limits["Adjust to","age"] <- 30
fit <- update(fit)   # make new reference value take effect
Predict(fit, age, ref.zero=TRUE, fun=exp)

# Make two curves, and plot the predicted curves as two trellis panels
w <- Predict(fit, age, sex)
require(lattice)
xyplot(yhat ~ age | sex, data=w, type='l')
# To add confidence bands we need to use the Hmisc xYplot function in
# place of xyplot
xYplot(Cbind(yhat,lower,upper) ~ age | sex, data=w, 
       method='filled bands', type='l', col.fill=gray(.95))
# If non-displayed variables were in the model, add a subtitle to show
# their settings using title(sub=paste('Adjusted to',attr(w,'info')$adjust),adj=0)
# Easier: feed w into plot.Predict, ggplot.Predict, plotp.Predict
## Not run: 
##D # Predictions form a parametric survival model
##D n <- 1000
##D set.seed(731)
##D age <- 50 + 12*rnorm(n)
##D label(age) <- "Age"
##D sex <- factor(sample(c('Male','Female'), n, 
##D               rep=TRUE, prob=c(.6, .4)))
##D cens <- 15*runif(n)
##D h <- .02*exp(.04*(age-50)+.8*(sex=='Female'))
##D t <- -log(runif(n))/h
##D label(t) <- 'Follow-up Time'
##D e <- ifelse(t<=cens,1,0)
##D t <- pmin(t, cens)
##D units(t) <- "Year"
##D ddist <- datadist(age, sex)
##D Srv <- Surv(t,e)
##D 
##D # Fit log-normal survival model and plot median survival time vs. age
##D f <- psm(Srv ~ rcs(age), dist='lognormal')
##D med <- Quantile(f)       # Creates function to compute quantiles
##D                          # (median by default)
##D Predict(f, age, fun=function(x)med(lp=x))
##D # Note: This works because med() expects the linear predictor (X*beta)
##D #       as an argument.  Would not work if use 
##D #       ref.zero=TRUE or adj.zero=TRUE.
##D # Also, confidence intervals from this method are approximate since
##D # they don't take into account estimation of scale parameter
##D 
##D # Fit an ols model to log(y) and plot the relationship between x1
##D # and the predicted mean(y) on the original scale without assuming
##D # normality of residuals; use the smearing estimator.  Before doing
##D # that, show confidence intervals for mean and individual log(y),
##D # and for the latter, also show bootstrap percentile nonparametric
##D # pointwise confidence limits
##D set.seed(1)
##D x1 <- runif(300)
##D x2 <- runif(300)
##D ddist <- datadist(x1,x2); options(datadist='ddist')
##D y  <- exp(x1+ x2 - 1 + rnorm(300))
##D f  <- ols(log(y) ~ pol(x1,2) + x2, x=TRUE, y=TRUE)  # x y for bootcov
##D fb <- bootcov(f, B=100)
##D pb <- Predict(fb, x1, x2=c(.25,.75))
##D p1 <- Predict(f,  x1, x2=c(.25,.75))
##D p <- rbind(normal=p1, boot=pb)
##D plot(p)
##D 
##D p1 <- Predict(f, x1, conf.type='mean')
##D p2 <- Predict(f, x1, conf.type='individual')
##D p  <- rbind(mean=p1, individual=p2)
##D plot(p, label.curve=FALSE)   # uses superposition
##D plot(p, ~x1 | .set.)         # 2 panels
##D 
##D r <- resid(f)
##D smean <- function(yhat)smearingEst(yhat, exp, res, statistic='mean')
##D formals(smean) <- list(yhat=numeric(0), res=r[!is.na(r)])
##D #smean$res <- r[!is.na(r)]   # define default res argument to function
##D Predict(f, x1, fun=smean)
##D 
##D ## Example using offset
##D g <- Glm(Y ~ offset(log(N)) + x1 + x2, family=poisson)
##D Predict(g, offset=list(N=100))
## End(Not run)
options(datadist=NULL)




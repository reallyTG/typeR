library(rms)


### Name: plot.Predict
### Title: Plot Effects of Variables Estimated by a Regression Model Fit
### Aliases: plot.Predict pantext
### Keywords: models hplot htest

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

fit <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol,4)),
               x=TRUE, y=TRUE)
an <- anova(fit)
# Plot effects of all 4 predictors with test statistics from anova, and P
plot(Predict(fit), anova=an, pval=TRUE)
plot(Predict(fit), data=llist(blood.pressure,age))
                         # rug plot for two of the predictors

p <- Predict(fit, name=c('age','cholesterol'))   # Make 2 plots
plot(p)

p <- Predict(fit, age=seq(20,80,length=100), sex, conf.int=FALSE)
                         # Plot relationship between age and log
                         # odds, separate curve for each sex,
plot(p, subset=sex=='female' | age > 30)
# No confidence interval, suppress estimates for males <= 30

p <- Predict(fit, age, sex)
plot(p, label.curves=FALSE, data=llist(age,sex))
                         # use label.curves=list(keys=c('a','b'))'
                         # to use 1-letter abbreviations
                         # data= allows rug plots (1-dimensional scatterplots)
                         # on each sex's curve, with sex-
                         # specific density of age
                         # If data were in data frame could have used that
p <- Predict(fit, age=seq(20,80,length=100), sex='male', fun=plogis)
                         # works if datadist not used
plot(p, ylab=expression(hat(P)))
                         # plot predicted probability in place of log odds

per <- function(x, y) x >= 30
plot(p, perim=per)       # suppress output for age < 30 but leave scale alone

# Take charge of the plot setup by specifying a lattice formula
p <- Predict(fit, age, blood.pressure=c(120,140,160),
             cholesterol=c(180,200,215), sex)
plot(p, ~ age | blood.pressure*cholesterol, subset=sex=='male')
# plot(p, ~ age | cholesterol*blood.pressure, subset=sex=='female')
# plot(p, ~ blood.pressure|cholesterol*round(age,-1), subset=sex=='male')
plot(p)

# Plot the age effect as an odds ratio
# comparing the age shown on the x-axis to age=30 years

ddist$limits$age[2] <- 30    # make 30 the reference value for age
# Could also do: ddist$limits["Adjust to","age"] <- 30
fit <- update(fit)   # make new reference value take effect
p <- Predict(fit, age, ref.zero=TRUE, fun=exp)
plot(p, ylab='Age=x:Age=30 Odds Ratio',
     abline=list(list(h=1, lty=2, col=2), list(v=30, lty=2, col=2)))

# Compute predictions for three predictors, with superpositioning or
# conditioning on sex, combined into one graph

p1 <- Predict(fit, age, sex)
p2 <- Predict(fit, cholesterol, sex)
p3 <- Predict(fit, blood.pressure, sex)
p <- rbind(age=p1, cholesterol=p2, blood.pressure=p3)
plot(p, groups='sex', varypred=TRUE, adj.subtitle=FALSE)
plot(p, cond='sex', varypred=TRUE, adj.subtitle=FALSE)

## Not run: 
##D # For males at the median blood pressure and cholesterol, plot 3 types
##D # of confidence intervals for the probability on one plot, for varying age
##D ages <- seq(20, 80, length=100)
##D p1 <- Predict(fit, age=ages, sex='male', fun=plogis)  # standard pointwise
##D p2 <- Predict(fit, age=ages, sex='male', fun=plogis,
##D               conf.type='simultaneous')               # simultaneous
##D p3 <- Predict(fit, age=c(60,65,70), sex='male', fun=plogis,
##D               conf.type='simultaneous')               # simultaneous 3 pts
##D # The previous only adjusts for a multiplicity of 3 points instead of 100
##D f <- update(fit, x=TRUE, y=TRUE)
##D g <- bootcov(f, B=500, coef.reps=TRUE)
##D p4 <- Predict(g, age=ages, sex='male', fun=plogis)    # bootstrap percentile
##D p <- rbind(Pointwise=p1, 'Simultaneous 100 ages'=p2,
##D            'Simultaneous     3 ages'=p3, 'Bootstrap nonparametric'=p4)
##D xYplot(Cbind(yhat, lower, upper) ~ age, groups=.set.,
##D        data=p, type='l', method='bands', label.curve=list(keys='lines'))
## End(Not run)

# Plots for a parametric survival model
n <- 1000
set.seed(731)
age <- 50 + 12*rnorm(n)
label(age) <- "Age"
sex <- factor(sample(c('Male','Female'), n, 
              rep=TRUE, prob=c(.6, .4)))
cens <- 15*runif(n)
h <- .02*exp(.04*(age-50)+.8*(sex=='Female'))
t <- -log(runif(n))/h
label(t) <- 'Follow-up Time'
e <- ifelse(t<=cens,1,0)
t <- pmin(t, cens)
units(t) <- "Year"
ddist <- datadist(age, sex)
Srv <- Surv(t,e)


# Fit log-normal survival model and plot median survival time vs. age
f <- psm(Srv ~ rcs(age), dist='lognormal')
med <- Quantile(f)       # Creates function to compute quantiles
                         # (median by default)
p <- Predict(f, age, fun=function(x) med(lp=x))
plot(p, ylab="Median Survival Time")
# Note: confidence intervals from this method are approximate since
# they don't take into account estimation of scale parameter


# Fit an ols model to log(y) and plot the relationship between x1
# and the predicted mean(y) on the original scale without assuming
# normality of residuals; use the smearing estimator
# See help file for rbind.Predict for a method of showing two
# types of confidence intervals simultaneously.
set.seed(1)
x1 <- runif(300)
x2 <- runif(300)
ddist <- datadist(x1,x2)
y  <- exp(x1+x2-1+rnorm(300))
f <- ols(log(y) ~ pol(x1,2)+x2)
r <- resid(f)
smean <- function(yhat)smearingEst(yhat, exp, res, statistic='mean')
formals(smean) <- list(yhat=numeric(0), res=r[!is.na(r)])
#smean$res <- r[!is.na(r)]   # define default res argument to function
plot(Predict(f, x1, fun=smean), ylab='Predicted Mean on y-scale')

# Make an 'interaction plot', forcing the x-axis variable to be
# plotted at integer values but labeled with category levels
n <- 100
set.seed(1)
gender <- c(rep('male', n), rep('female',n))
m <- sample(c('a','b'), 2*n, TRUE)
d <-  datadist(gender, m); options(datadist='d')
anxiety <- runif(2*n) + .2*(gender=='female') + .4*(gender=='female' & m=='b')
tapply(anxiety, llist(gender,m), mean)
f <- ols(anxiety ~ gender*m)
p <- Predict(f, gender, m)
plot(p)     # horizontal dot chart; usually preferred for categorical predictors
Key(.5, .5)
plot(p, ~gender, groups='m', nlines=TRUE)
plot(p, ~m, groups='gender', nlines=TRUE)
plot(p, ~gender|m, nlines=TRUE)

options(datadist=NULL)

## Not run: 
##D # Example in which separate curves are shown for 4 income values
##D # For each curve the estimated percentage of voters voting for
##D # the democratic party is plotted against the percent of voters
##D # who graduated from college.  Data are county-level percents.
##D 
##D incomes <- seq(22900, 32800, length=4)  
##D # equally spaced to outer quintiles
##D p <- Predict(f, college, income=incomes, conf.int=FALSE)
##D plot(p, xlim=c(0,35), ylim=c(30,55))
##D 
##D # Erase end portions of each curve where there are fewer than 10 counties having
##D # percent of college graduates to the left of the x-coordinate being plotted,
##D # for the subset of counties having median family income with 1650
##D # of the target income for the curve
##D 
##D show.pts <- function(college.pts, income.pt) {
##D   s <- abs(income - income.pt) < 1650  #assumes income known to top frame
##D   x <- college[s]
##D   x <- sort(x[!is.na(x)])
##D   n <- length(x)
##D   low <- x[10]; high <- x[n-9]
##D   college.pts >= low & college.pts <= high
##D }
##D 
##D plot(p, xlim=c(0,35), ylim=c(30,55), perim=show.pts)
##D 
##D # Rename variables for better plotting of a long list of predictors
##D f <- ...
##D p <- Predict(f)
##D re <- c(trt='treatment', diabet='diabetes', sbp='systolic blood pressure')
##D 
##D for(n in names(re)) {
##D   names(p)[names(p)==n] <- re[n]
##D   p$.predictor.[p$.predictor.==n] <- re[n]
##D   }
##D plot(p)
## End(Not run)




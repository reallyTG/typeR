library(rms)


### Name: ggplot.Predict
### Title: Plot Effects of Variables Estimated by a Regression Model Fit
###   Using ggplot2
### Aliases: ggplot.Predict
### Keywords: models hplot htest

### ** Examples

n <- 350     # define sample size
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
  (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male')) +
  .01 * (blood.pressure - 120)
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)

ddist <- datadist(age, blood.pressure, cholesterol, sex)
options(datadist='ddist')

fit <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol,4)),
               x=TRUE, y=TRUE)
an <- anova(fit)
# Plot effects in two vertical sub-panels with continuous predictors on top
# ggplot(Predict(fit), sepdiscrete='vertical')
# Plot effects of all 4 predictors with test statistics from anova, and P
ggplot(Predict(fit), anova=an, pval=TRUE)
# ggplot(Predict(fit), rdata=llist(blood.pressure, age))
# spike histogram plot for two of the predictors

# p <- Predict(fit, name=c('age','cholesterol'))   # Make 2 plots
# ggplot(p)

# p <- Predict(fit, age=seq(20,80,length=100), sex, conf.int=FALSE)
#                        # Plot relationship between age and log
                         # odds, separate curve for each sex,
# ggplot(p, subset=sex=='female' | age > 30)
# No confidence interval, suppress estimates for males <= 30

# p <- Predict(fit, age, sex)
# ggplot(p, rdata=llist(age,sex))
                         # rdata= allows rug plots (1-dimensional scatterplots)
                         # on each sex's curve, with sex-
                         # specific density of age
                         # If data were in data frame could have used that
# p <- Predict(fit, age=seq(20,80,length=100), sex='male', fun=plogis)
                         # works if datadist not used
# ggplot(p, ylab=expression(hat(P)))
                         # plot predicted probability in place of log odds
# per <- function(x, y) x >= 30
# ggplot(p, perim=per)       # suppress output for age < 30 but leave scale alone

# Do ggplot2 faceting a few different ways
p <- Predict(fit, age, sex, blood.pressure=c(120,140,160),
             cholesterol=c(180,200,215))
# ggplot(p)
ggplot(p, cholesterol ~ blood.pressure)
# ggplot(p, ~ cholesterol + blood.pressure)
# color for sex, line type for blood.pressure:
ggplot(p, groups=c('sex', 'blood.pressure'))
# Add legend.position='top' to allow wider plot
# Map blood.pressure to line thickness instead of line type:
# ggplot(p, groups=c('sex', 'blood.pressure'), aestype=c('color', 'size'))

# Plot the age effect as an odds ratio
# comparing the age shown on the x-axis to age=30 years

# ddist$limits$age[2] <- 30    # make 30 the reference value for age
# Could also do: ddist$limits["Adjust to","age"] <- 30
# fit <- update(fit)   # make new reference value take effect
# p <- Predict(fit, age, ref.zero=TRUE, fun=exp)
# ggplot(p, ylab='Age=x:Age=30 Odds Ratio',
#        addlayer=geom_hline(yintercept=1, col=gray(.8)) +
#                 geom_vline(xintercept=30, col=gray(.8)) +
#                 scale_y_continuous(trans='log',
#                       breaks=c(.5, 1, 2, 4, 8))))

# Compute predictions for three predictors, with superpositioning or
# conditioning on sex, combined into one graph

p1 <- Predict(fit, age, sex)
p2 <- Predict(fit, cholesterol, sex)
p3 <- Predict(fit, blood.pressure, sex)
p <- rbind(age=p1, cholesterol=p2, blood.pressure=p3)
ggplot(p, groups='sex', varypred=TRUE, adj.subtitle=FALSE)
# ggplot(p, groups='sex', varypred=TRUE, adj.subtitle=FALSE, sepdiscrete='vert')

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
##D # as.data.frame so will call built-in ggplot
##D ggplot(as.data.frame(p), aes(x=age, y=yhat)) + geom_line() +
##D  geom_ribbon(data=p, aes(ymin=lower, ymax=upper), alpha=0.2, linetype=0)+
##D  facet_wrap(~ .set., ncol=2)
##D 
##D # Plots for a parametric survival model
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
##D p <- Predict(f, age, fun=function(x) med(lp=x))
##D ggplot(p, ylab="Median Survival Time")
##D # Note: confidence intervals from this method are approximate since
##D # they don't take into account estimation of scale parameter
##D 
##D 
##D # Fit an ols model to log(y) and plot the relationship between x1
##D # and the predicted mean(y) on the original scale without assuming
##D # normality of residuals; use the smearing estimator
##D # See help file for rbind.Predict for a method of showing two
##D # types of confidence intervals simultaneously.
##D # Add raw data scatterplot to graph
##D set.seed(1)
##D x1 <- runif(300)
##D x2 <- runif(300)
##D ddist <- datadist(x1, x2); options(datadist='ddist')
##D y  <- exp(x1 + x2 - 1 + rnorm(300))
##D f <- ols(log(y) ~ pol(x1,2) + x2)
##D r <- resid(f)
##D smean <- function(yhat)smearingEst(yhat, exp, res, statistic='mean')
##D formals(smean) <- list(yhat=numeric(0), res=r[! is.na(r)])
##D #smean$res <- r[! is.na(r)]   # define default res argument to function
##D ggplot(Predict(f, x1, fun=smean), ylab='Predicted Mean on y-scale', 
##D    addlayer=geom_point(aes(x=x1, y=y), data.frame(x1, y)))
##D # Had ggplot not added a subtitle (i.e., if x2 were not present), you
##D # could have done ggplot(Predict(), ylab=...) + geom_point(...) 
## End(Not run)

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
# ggplot(p)     # horizontal dot chart; usually preferred for categorical predictors
# ggplot(p, flipxdiscrete=FALSE)  # back to vertical
ggplot(p, groups='gender')
ggplot(p, ~ m, groups=FALSE, flipxdiscrete=FALSE)

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
##D ggplot(p, xlim=c(0,35), ylim=c(30,55))
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
##D ggplot(p, xlim=c(0,35), ylim=c(30,55), perim=show.pts)
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
##D ggplot(p)
## End(Not run)




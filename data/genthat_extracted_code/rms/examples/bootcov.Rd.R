library(rms)


### Name: bootcov
### Title: Bootstrap Covariance and Distribution for Regression
###   Coefficients
### Aliases: bootcov bootplot bootplot.bootcov confplot confplot.bootcov
###   histdensity
### Keywords: models regression htest methods hplot

### ** Examples

set.seed(191)
x <- exp(rnorm(200))
logit <- 1 + x/2
y <- ifelse(runif(200) <= plogis(logit), 1, 0)
f <- lrm(y ~ pol(x,2), x=TRUE, y=TRUE)
g <- bootcov(f, B=50, pr=TRUE)
anova(g)    # using bootstrap covariance estimates
fastbw(g)   # using bootstrap covariance estimates
beta <- g$boot.Coef[,1]
hist(beta, nclass=15)     #look at normality of parameter estimates
qqnorm(beta)
# bootplot would be better than these last two commands


# A dataset contains a variable number of observations per subject,
# and all observations are laid out in separate rows. The responses
# represent whether or not a given segment of the coronary arteries
# is occluded. Segments of arteries may not operate independently
# in the same patient.  We assume a "working independence model" to
# get estimates of the coefficients, i.e., that estimates assuming
# independence are reasonably efficient.  The job is then to get
# unbiased estimates of variances and covariances of these estimates.


set.seed(2)
n.subjects <- 30
ages <- rnorm(n.subjects, 50, 15)
sexes  <- factor(sample(c('female','male'), n.subjects, TRUE))
logit <- (ages-50)/5
prob <- plogis(logit)  # true prob not related to sex
id <- sample(1:n.subjects, 300, TRUE) # subjects sampled multiple times
table(table(id))  # frequencies of number of obs/subject
age <- ages[id]
sex <- sexes[id]
# In truth, observations within subject are independent:
y   <- ifelse(runif(300) <= prob[id], 1, 0)
f <- lrm(y ~ lsp(age,50)*sex, x=TRUE, y=TRUE)
g <- bootcov(f, id, B=50)  # usually do B=200 or more
diag(g$var)/diag(f$var)
# add ,group=w to re-sample from within each level of w
anova(g)            # cluster-adjusted Wald statistics
# fastbw(g)         # cluster-adjusted backward elimination
plot(Predict(g, age=30:70, sex='female'))  # cluster-adjusted confidence bands


# Get design effects based on inflation of the variances when compared
# with bootstrap estimates which ignore clustering
g2 <- bootcov(f, B=50)
diag(g$var)/diag(g2$var)


# Get design effects based on pooled tests of factors in model
anova(g2)[,1] / anova(g)[,1]


# Simulate binary data where there is a strong 
# age x sex interaction with linear age effects 
# for both sexes, but where not knowing that
# we fit a quadratic model.  Use the bootstrap
# to get bootstrap distributions of various
# effects, and to get pointwise and simultaneous
# confidence limits


set.seed(71)
n   <- 500
age <- rnorm(n, 50, 10)
sex <- factor(sample(c('female','male'), n, rep=TRUE))
L   <- ifelse(sex=='male', 0, .1*(age-50))
y   <- ifelse(runif(n)<=plogis(L), 1, 0)


f <- lrm(y ~ sex*pol(age,2), x=TRUE, y=TRUE)
b <- bootcov(f, B=50, loglik=TRUE, pr=TRUE)   # better: B=500


par(mfrow=c(2,3))
# Assess normality of regression estimates
bootplot(b, which=1:6, what='qq')
# They appear somewhat non-normal


# Plot histograms and estimated densities 
# for 6 coefficients
w <- bootplot(b, which=1:6)
# Print bootstrap quantiles
w$quantiles

# Show box plots for bootstrap reps for all coefficients
bootplot(b, what='box')


# Estimate regression function for females
# for a sequence of ages
ages <- seq(25, 75, length=100)
label(ages) <- 'Age'


# Plot fitted function and pointwise normal-
# theory confidence bands
par(mfrow=c(1,1))
p <- Predict(f, age=ages, sex='female')
plot(p)
# Save curve coordinates for later automatic
# labeling using labcurve in the Hmisc library
curves <- vector('list',8)
curves[[1]] <- with(p, list(x=age, y=lower))
curves[[2]] <- with(p, list(x=age, y=upper))


# Add pointwise normal-distribution confidence 
# bands using unconditional variance-covariance
# matrix from the 500 bootstrap reps
p <- Predict(b, age=ages, sex='female')
curves[[3]] <- with(p, list(x=age, y=lower))
curves[[4]] <- with(p, list(x=age, y=upper))


dframe <- expand.grid(sex='female', age=ages)
X <- predict(f, dframe, type='x')  # Full design matrix


# Add pointwise bootstrap nonparametric 
# confidence limits
p <- confplot(b, X=X, against=ages, method='pointwise',
              add=TRUE, lty.conf=4)
curves[[5]] <- list(x=ages, y=p$lower)
curves[[6]] <- list(x=ages, y=p$upper)


# Add simultaneous bootstrap confidence band
p <- confplot(b, X=X, against=ages, add=TRUE, lty.conf=5)
curves[[7]] <- list(x=ages, y=p$lower)
curves[[8]] <- list(x=ages, y=p$upper)
lab <- c('a','a','b','b','c','c','d','d')
labcurve(curves, lab, pl=TRUE)


# Now get bootstrap simultaneous confidence set for
# female:male odds ratios for a variety of ages


dframe <- expand.grid(age=ages, sex=c('female','male'))
X <- predict(f, dframe, type='x')  # design matrix
f.minus.m <- X[1:100,] - X[101:200,]
# First 100 rows are for females.  By subtracting
# design matrices are able to get Xf*Beta - Xm*Beta
# = (Xf - Xm)*Beta


confplot(b, X=f.minus.m, against=ages,
         method='pointwise', ylab='F:M Log Odds Ratio')
confplot(b, X=f.minus.m, against=ages,
         lty.conf=3, add=TRUE)


# contrast.rms makes it easier to compute the design matrix for use
# in bootstrapping contrasts:


f.minus.m <- contrast(f, list(sex='female',age=ages),
                         list(sex='male',  age=ages))$X
confplot(b, X=f.minus.m)


# For a quadratic binary logistic regression model use bootstrap
# bumping to estimate coefficients under a monotonicity constraint
set.seed(177)
n <- 400
x <- runif(n)
logit <- 3*(x^2-1)
y <- rbinom(n, size=1, prob=plogis(logit))
f <- lrm(y ~ pol(x,2), x=TRUE, y=TRUE)
k <- coef(f)
k
vertex <- -k[2]/(2*k[3])
vertex


# Outside [0,1] so fit satisfies monotonicity constraint within
# x in [0,1], i.e., original fit is the constrained MLE


g <- bootcov(f, B=50, coef.reps=TRUE, loglik=TRUE)
bootcoef <- g$boot.Coef    # 100x3 matrix
vertex <- -bootcoef[,2]/(2*bootcoef[,3])
table(cut2(vertex, c(0,1)))
mono <- !(vertex >= 0 & vertex <= 1)
mean(mono)    # estimate of Prob{monotonicity in [0,1]}


var(bootcoef)   # var-cov matrix for unconstrained estimates
var(bootcoef[mono,])   # for constrained estimates


# Find second-best vector of coefficient estimates, i.e., best
# from among bootstrap estimates
g$boot.Coef[order(g$boot.loglik[-length(g$boot.loglik)])[1],]
# Note closeness to MLE

## Not run: 
##D # Get the bootstrap distribution of the difference in two ROC areas for
##D # two binary logistic models fitted on the same dataset.  This analysis
##D # does not adjust for the bias ROC area (C-index) due to overfitting.
##D # The same random number seed is used in two runs to enforce pairing.
##D 
##D set.seed(17)
##D x1 <- rnorm(100)
##D x2 <- rnorm(100)
##D y <- sample(0:1, 100, TRUE)
##D f <- lrm(y ~ x1, x=TRUE, y=TRUE)
##D g <- lrm(y ~ x1 + x2, x=TRUE, y=TRUE)
##D set.seed(3)
##D f <- bootcov(f, stat='C')
##D set.seed(3)
##D g <- bootcov(g, stat='C')
##D dif <- g$boot.stats - f$boot.stats
##D hist(dif)
##D quantile(dif, c(.025,.25,.5,.75,.975))
##D # Compute a z-test statistic.  Note that comparing ROC areas is far less
##D # powerful than likelihood or Brier score-based methods
##D z <- (g$stats['C'] - f$stats['C'])/sd(dif)
##D names(z) <- NULL
##D c(z=z, P=2*pnorm(-abs(z)))
## End(Not run)




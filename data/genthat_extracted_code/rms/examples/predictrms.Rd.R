library(rms)


### Name: predictrms
### Title: Predicted Values from Model Fit
### Aliases: predictrms predict.rms predict.bj predict.cph predict.Glm
###   predict.Gls predict.ols predict.psm
### Keywords: models regression

### ** Examples

n <- 1000    # define sample size
set.seed(17) # so can reproduce the results
age            <- rnorm(n, 50, 10)
blood.pressure <- rnorm(n, 120, 15)
cholesterol    <- rnorm(n, 200, 25)
sex            <- factor(sample(c('female','male'), n,TRUE))
treat          <- factor(sample(c('a','b','c'), n,TRUE))


# Specify population model for log odds that Y=1
L <- .4*(sex=='male') + .045*(age-50) +
  (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male')) +
  .3*sqrt(blood.pressure-60)-2.3 + 1*(treat=='b')
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)


ddist <- datadist(age, blood.pressure, cholesterol, sex, treat)
options(datadist='ddist')


fit <- lrm(y ~ rcs(blood.pressure,4) + 
           sex * (age + rcs(cholesterol,4)) + sex*treat*age)


# Use xYplot to display predictions in 9 panels, with error bars,
# with superposition of two treatments


dat <- expand.grid(treat=levels(treat),sex=levels(sex),
                   age=c(20,40,60),blood.pressure=120,
                   cholesterol=seq(100,300,length=10))
# Add variables linear.predictors and se.fit to dat
dat <- cbind(dat, predict(fit, dat, se.fit=TRUE))
# This is much easier with Predict
# xYplot in Hmisc extends xyplot to allow error bars
xYplot(Cbind(linear.predictors,linear.predictors-1.96*se.fit,
             linear.predictors+1.96*se.fit) ~ cholesterol | sex*age,
       groups=treat, data=dat, type='b')




# Since blood.pressure doesn't interact with anything, we can quickly and
# interactively try various transformations of blood.pressure, taking
# the fitted spline function as the gold standard. We are seeking a
# linearizing transformation even though this may lead to falsely
# narrow confidence intervals if we use this data-dredging-based transformation


bp <- 70:160
logit <- predict(fit, expand.grid(treat="a", sex='male', age=median(age),
                 cholesterol=median(cholesterol),
                 blood.pressure=bp), type="terms")[,"blood.pressure"]
#Note: if age interacted with anything, this would be the age
#      "main effect" ignoring interaction terms
#Could also use Predict(f, age=ag)$yhat
#which allows evaluation of the shape for any level of interacting
#factors.  When age does not interact with anything, the result from
#predict(f, ..., type="terms") would equal the result from
#plot if all other terms were ignored


plot(bp^.5, logit)               # try square root vs. spline transform.
plot(bp^1.5, logit)              # try 1.5 power
plot(sqrt(bp-60), logit)


#Some approaches to making a plot showing how predicted values
#vary with a continuous predictor on the x-axis, with two other
#predictors varying


combos <- gendata(fit, age=seq(10,100,by=10), cholesterol=c(170,200,230),
                  blood.pressure=c(80,120,160))
#treat, sex not specified -> set to mode
#can also used expand.grid


combos$pred <- predict(fit, combos)
xyplot(pred ~ age | cholesterol*blood.pressure, data=combos, type='l')
xYplot(pred ~ age | cholesterol, groups=blood.pressure, data=combos, type='l')
Key()   # Key created by xYplot
xYplot(pred ~ age, groups=interaction(cholesterol,blood.pressure),
       data=combos, type='l', lty=1:9)
Key()


# Add upper and lower 0.95 confidence limits for individuals
combos <- cbind(combos, predict(fit, combos, conf.int=.95))
xYplot(Cbind(linear.predictors, lower, upper) ~ age | cholesterol,
       groups=blood.pressure, data=combos, type='b')
Key()


# Plot effects of treatments (all pairwise comparisons) vs.
# levels of interacting factors (age, sex)


d <- gendata(fit, treat=levels(treat), sex=levels(sex), age=seq(30,80,by=10))
x <- predict(fit, d, type="x")
betas <- fit$coef
cov   <- vcov(fit, intercepts='none')


i <- d$treat=="a"; xa <- x[i,]; Sex <- d$sex[i]; Age <- d$age[i]
i <- d$treat=="b"; xb <- x[i,]
i <- d$treat=="c"; xc <- x[i,]


doit <- function(xd, lab) {
  xb <- matxv(xd, betas)
  se <- apply((xd %*% cov) * xd, 1, sum)^.5
  q <- qnorm(1-.01/2)   # 0.99 confidence limits
  lower <- xb - q * se; upper <- xb + q * se
  #Get odds ratios instead of linear effects
  xb <- exp(xb); lower <- exp(lower); upper <- exp(upper)
  #First elements of these agree with 
  #summary(fit, age=30, sex='female',conf.int=.99))
  for(sx in levels(Sex)) {
    j <- Sex==sx
    errbar(Age[j], xb[j], upper[j], lower[j], xlab="Age", 
           ylab=paste(lab, "Odds Ratio"), ylim=c(.1, 20), log='y')
    title(paste("Sex:", sx))
    abline(h=1, lty=2)
  }
}


par(mfrow=c(3,2), oma=c(3,0,3,0))
doit(xb - xa, "b:a")
doit(xc - xa, "c:a")
doit(xb - xa, "c:b")

# NOTE: This is much easier to do using contrast.rms

# Demonstrate type="terms", "cterms", "ccterms"
set.seed(1)
n <- 40
x <- 1:n
w <- factor(sample(c('a', 'b'), n, TRUE))
u <- factor(sample(c('A', 'B'), n, TRUE))
y <- .01*x + .2*(w=='b') + .3*(u=='B') + .2*(w=='b' & u=='B') + rnorm(n)/5
ddist <- datadist(x, w, u)
f <- ols(y ~ x*w*u, x=TRUE, y=TRUE)
f
anova(f)
z <- predict(f, type='terms', center.terms=FALSE)
z[1:5,]
k <- coef(f)
## Manually compute combined terms
wb <- w=='b'
uB <- u=='B'
h  <- k['x * w=b * u=B']*x*wb*uB
tx <- k['x']  *x  + k['x * w=b']*x*wb + k['x * u=B']  *x*uB  + h
tw <- k['w=b']*wb + k['x * w=b']*x*wb + k['w=b * u=B']*wb*uB + h
tu <- k['u=B']*uB + k['x * u=B']*x*uB + k['w=b * u=B']*wb*uB + h
h   <- z[,'x * w * u'] # highest order term is present in all cterms
tx2 <- z[,'x']+z[,'x * w']+z[,'x * u']+h
tw2 <- z[,'w']+z[,'x * w']+z[,'w * u']+h
tu2 <- z[,'u']+z[,'x * u']+z[,'w * u']+h
ae <- function(a, b) all.equal(a, b, check.attributes=FALSE)
ae(tx, tx2)
ae(tw, tw2)
ae(tu, tu2)

zc <- predict(f, type='cterms')
zc[1:5,]
ae(tx, zc[,'x'])
ae(tw, zc[,'w'])
ae(tu, zc[,'u'])

zc <- predict(f, type='ccterms')
# As all factors are indirectly related, ccterms gives overall linear
# predictor except for the intercept
zc[1:5,]
ae(as.vector(zc + coef(f)[1]), f$linear.predictors)

## Not run: 
##D #A variable state.code has levels "1", "5","13"
##D #Get predictions with or without converting variable in newdata to factor
##D predict(fit, data.frame(state.code=c(5,13)))
##D predict(fit, data.frame(state.code=factor(c(5,13))))
##D 
##D 
##D #Use gendata function (gendata.rms) for interactive specification of
##D #predictor variable settings (for 10 observations)
##D df <- gendata(fit, nobs=10, viewvals=TRUE)
##D df$predicted <- predict(fit, df)  # add variable to data frame
##D df
##D 
##D 
##D df <- gendata(fit, age=c(10,20,30))  # leave other variables at ref. vals.
##D predict(fit, df, type="fitted")
##D 
##D 
##D # See reShape (in Hmisc) for an example where predictions corresponding to 
##D # values of one of the varying predictors are reformatted into multiple
##D # columns of a matrix
## End(Not run)
options(datadist=NULL)




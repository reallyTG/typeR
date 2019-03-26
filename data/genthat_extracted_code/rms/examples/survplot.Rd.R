library(rms)


### Name: survplot
### Title: Plot Survival Curves and Hazard Functions
### Aliases: survplot survplotp survplot.rms survplot.npsurv
###   survplotp.npsurv survdiffplot
### Keywords: survival hplot nonparametric models

### ** Examples

# Simulate data from a population model in which the log hazard
# function is linear in age and there is no age x sex interaction
n <- 1000
set.seed(731)
age <- 50 + 12*rnorm(n)
label(age) <- "Age"
sex <- factor(sample(c('male','female'), n, TRUE))
cens <- 15*runif(n)
h <- .02*exp(.04*(age-50)+.8*(sex=='female'))
dt <- -log(runif(n))/h
label(dt) <- 'Follow-up Time'
e <- ifelse(dt <= cens,1,0)
dt <- pmin(dt, cens)
units(dt) <- "Year"
dd <- datadist(age, sex)
options(datadist='dd')
S <- Surv(dt,e)

# When age is in the model by itself and we predict at the mean age,
# approximate confidence intervals are ok

f <- cph(S ~ age, surv=TRUE)
survplot(f, age=mean(age), conf.int=.95)
g <- cph(S ~ age, x=TRUE, y=TRUE)
survplot(g, age=mean(age), conf.int=.95, add=TRUE, col='red', conf='bars')

# Repeat for an age far from the mean; not ok
survplot(f, age=75, conf.int=.95)
survplot(g, age=75, conf.int=.95, add=TRUE, col='red', conf='bars')


#Plot stratified survival curves by sex, adj for quadratic age effect
# with age x sex interaction (2 d.f. interaction)

f <- cph(S ~ pol(age,2)*strat(sex), x=TRUE, y=TRUE)
#or f <- psm(S ~ pol(age,2)*sex)
Predict(f, sex, age=c(30,50,70))
survplot(f, sex, n.risk=TRUE, levels.only=TRUE)   #Adjust age to median
survplot(f, sex, logt=TRUE, loglog=TRUE)   #Check for Weibull-ness (linearity)
survplot(f, sex=c("male","female"), age=50)
                                        #Would have worked without datadist
                                        #or with an incomplete datadist
survplot(f, sex, label.curves=list(keys=c(2,0), point.inc=2))
                                        #Identify curves with symbols


survplot(f, sex, label.curves=list(keys=c('m','f')))
                                        #Identify curves with single letters


#Plots by quintiles of age, adjusting sex to male
options(digits=3)
survplot(f, age=quantile(age,(1:4)/5), sex="male")


#Plot survival Kaplan-Meier survival estimates for males
f <- npsurv(S ~ 1, subset=sex=="male")
survplot(f)


#Plot survival for both sexes and show exponential hazard estimates
f <- npsurv(S ~ sex)
survplot(f, aehaz=TRUE)
#Check for log-normal and log-logistic fits
survplot(f, fun=qnorm, ylab="Inverse Normal Transform")
survplot(f, fun=function(y)log(y/(1-y)), ylab="Logit S(t)")

#Plot the difference between sexes
survdiffplot(f)

#Similar but show half-width of confidence intervals centered
#at average of two survival estimates
survplot(f, conf='diffbands')

options(datadist=NULL)
## Not run: 
##D #
##D # Time to progression/death for patients with monoclonal gammopathy
##D # Competing risk curves (cumulative incidence)
##D # status variable must be a factor with first level denoting right censoring
##D m <- upData(mgus1, stop = stop / 365.25, units=c(stop='years'),
##D             labels=c(stop='Follow-up Time'), subset=start == 0)
##D f <- npsurv(Surv(stop, event) ~ 1, data=m)
##D 
##D # Use survplot for enhanced displays of cumulative incidence curves for
##D # competing risks
##D 
##D survplot(f, state='pcm', n.risk=TRUE, xlim=c(0, 20), ylim=c(0, .5), col=2)
##D survplot(f, state='death', aehaz=TRUE, col=3,
##D          label.curves=list(keys='lines'))
##D f <- npsurv(Surv(stop, event) ~ sex, data=m)
##D survplot(f, state='death', aehaz=TRUE, n.risk=TRUE, conf='diffbands',
##D          label.curves=list(keys='lines'))
## End(Not run)




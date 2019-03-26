library(rms)


### Name: validate.lrm
### Title: Resampling Validation of a Logistic or Ordinal Regression Model
### Aliases: validate.lrm validate.orm
### Keywords: models regression

### ** Examples

n <- 1000    # define sample size
age            <- rnorm(n, 50, 10)
blood.pressure <- rnorm(n, 120, 15)
cholesterol    <- rnorm(n, 200, 25)
sex            <- factor(sample(c('female','male'), n,TRUE))


# Specify population model for log odds that Y=1
L <- .4*(sex=='male') + .045*(age-50) +
  (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male'))
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)


f <- lrm(y ~ sex*rcs(cholesterol)+pol(age,2)+blood.pressure, x=TRUE, y=TRUE)
#Validate full model fit
validate(f, B=10)              # normally B=300
validate(f, B=10, group=y)  
# two-sample validation: make resamples have same numbers of
# successes and failures as original sample


#Validate stepwise model with typical (not so good) stopping rule
validate(f, B=10, bw=TRUE, rule="p", sls=.1, type="individual")


## Not run: 
##D #Fit a continuation ratio model and validate it for the predicted
##D #probability that y=0
##D u <- cr.setup(y)
##D Y <- u$y
##D cohort <- u$cohort
##D attach(mydataframe[u$subs,])
##D f <- lrm(Y ~ cohort+rcs(age,4)*sex, penalty=list(interaction=2))
##D validate(f, cluster=u$subs, subset=cohort=='all') 
##D #see predab.resample for cluster and subset
## End(Not run)




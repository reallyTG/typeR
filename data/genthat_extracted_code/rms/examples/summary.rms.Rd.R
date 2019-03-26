library(rms)


### Name: summary.rms
### Title: Summary of Effects in Model
### Aliases: summary.rms print.summary.rms latex.summary.rms
###   html.summary.rms plot.summary.rms
### Keywords: models regression htest survival hplot interface

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


s <- summary(fit)                # Estimate effects using default ranges
                                 # Gets odds ratio for age=3rd quartile
                                 # compared to 1st quartile
## Not run: 
##D latex(s)                         # Use LaTeX to print nice version
##D latex(s, file="")                # Just write LaTeX code to console
##D html(s)                          # html/LaTeX to console for knitr
##D # Or:
##D options(prType='latex')
##D summary(fit)                     # prints with LaTeX, table.env=FALSE
##D options(prType='html')
##D summary(fit)                     # prints with html
## End(Not run)
summary(fit, sex='male', age=60) # Specify ref. cell and adjustment val
summary(fit, age=c(50,70))       # Estimate effect of increasing age from
                                 # 50 to 70
s <- summary(fit, age=c(50,60,70)) 
                                 # Increase age from 50 to 70, adjust to
                                 # 60 when estimating effects of other factors
#Could have omitted datadist if specified 3 values for all non-categorical
#variables (1 value for categorical ones - adjustment level)
plot(s, log=TRUE, at=c(.1,.5,1,1.5,2,4,8))


options(datadist=NULL)




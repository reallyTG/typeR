library(rms)


### Name: plotp.Predict
### Title: Plot Effects of Variables Estimated by a Regression Model Fit
###   Using plotly
### Aliases: plotp.Predict plotp
### Keywords: models hplot htest

### ** Examples

## Not run: 
##D n <- 350     # define sample size
##D set.seed(17) # so can reproduce the results
##D age            <- rnorm(n, 50, 10)
##D blood.pressure <- rnorm(n, 120, 15)
##D cholesterol    <- rnorm(n, 200, 25)
##D sex            <- factor(sample(c('female','male'), n,TRUE))
##D label(age)            <- 'Age'      # label is in Hmisc
##D label(cholesterol)    <- 'Total Cholesterol'
##D label(blood.pressure) <- 'Systolic Blood Pressure'
##D label(sex)            <- 'Sex'
##D units(cholesterol)    <- 'mg/dl'   # uses units.default in Hmisc
##D units(blood.pressure) <- 'mmHg'
##D 
##D # Specify population model for log odds that Y=1
##D L <- .4*(sex=='male') + .045*(age-50) +
##D     (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male')) +
##D     .01 * (blood.pressure - 120)
##D # Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
##D y <- ifelse(runif(n) < plogis(L), 1, 0)
##D 
##D ddist <- datadist(age, blood.pressure, cholesterol, sex)
##D options(datadist='ddist')
##D 
##D fit <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol,4)),
##D            x=TRUE, y=TRUE)
##D 
##D p <- plotp(Predict(fit))
##D p$Continuous
##D p$Categorical
##D # When using Rmarkdown html notebook, best to use
##D # prList(p) to render the two objects
##D plotp(Predict(fit), rdata=llist(blood.pressure, age))$Continuous
##D # spike histogram plot for two of the predictors
##D 
##D p <- Predict(fit, name=c('age','cholesterol'))   # Make 2 plots
##D plotp(p)
##D 
##D p <- Predict(fit, age, sex)
##D plotp(p, rdata=llist(age,sex))
##D # rdata= allows rug plots (1-dimensional scatterplots)
##D # on each sex's curve, with sex-
##D # specific density of age
##D # If data were in data frame could have used that
##D p <- Predict(fit, age=seq(20,80,length=100), sex='male', fun=plogis)
##D # works if datadist not used
##D plotp(p, ylab='P')
##D # plot predicted probability in place of log odds
##D 
##D # Compute predictions for three predictors, with superpositioning or
##D # conditioning on sex, combined into one graph
##D 
##D p1 <- Predict(fit, age, sex)
##D p2 <- Predict(fit, cholesterol, sex)
##D p3 <- Predict(fit, blood.pressure, sex)
##D p <- rbind(age=p1, cholesterol=p2, blood.pressure=p3)
##D plotp(p, ncols=2, rdata=llist(age, cholesterol, sex))
## End(Not run)




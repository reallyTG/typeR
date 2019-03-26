library(FindIt)


### Name: FindIt
### Title: FindIt for Estimating Heterogeneous Treatment Effects
### Aliases: FindIt summary.FindIt

### ** Examples



################################################### 
## Example 1: Treatment-Covariate Interaction
################################################### 
data(LaLonde)

## The model includes a treatment variable, 
## nine covariates to be interacted with the treatment variable,
## and the same nine covariates to be adjusted.

## Not run: 
##D 
##D ## Run to find the LASSO parameters
##D F1  <-FindIt(model.treat= outcome ~ treat,
##D              model.main= ~ age+educ+black+hisp+white+
##D              marr+nodegr+log.re75+u75,
##D              model.int= ~ age+educ+black+hisp+white+
##D              marr+nodegr+log.re75+u75,
##D              data = LaLonde,  
##D              type="binary",
##D              treat.type="single") 
## End(Not run)

## Fit with uncovered lambda parameters.
F1  <-FindIt(model.treat= outcome ~ treat,
             model.main= ~ age+educ+black+hisp+white+
             marr+nodegr+log.re75+u75,
             model.int= ~ age+educ+black+hisp+white+
             marr+nodegr+log.re75+u75,
             data = LaLonde, 
             type="binary",
             treat.type="single",
             search.lambdas=FALSE,
             lambdas = c(-3.8760,-4.0025) )

summary(F1)

## Returns all the estimated treatment effects. 
pred1 <- predict(F1)
## Top10
head(pred1$data, n=10)
## Bottom 10
tail(pred1$data ,n=10)

## Visualize all the estimated treatment effects.
## Not run: 
##D plot(pred1)
## End(Not run)

################################################### 
## Example 2: Treatment-Treatment Interaction
################################################### 

## Not run: 
##D data(GerberGreen)
##D 
##D ## The model includes four factorial treatments and 
##D ## all two, three, four-way interactions between them.
##D ## Four pre-treatment covariates are adjusted.
##D 
##D ## Run to search for lambdas.
##D F2<- FindIt(model.treat= voted98 ~ persngrp+phnscrpt+mailings+appeal,
##D              nway=4,
##D              model.main= ~ age+majorpty+vote96.1+vote96.0,
##D              data = GerberGreen,
##D              type="binary",
##D              treat.type="multiple")
##D 
##D ## Fit, given selected lambdas.
##D F2<- FindIt(model.treat= voted98 ~ persngrp+phnscrpt+mailings+appeal,
##D              nway=4,
##D              model.main= ~ age+majorpty+vote96.1+vote96.0,
##D              data = GerberGreen,
##D              type="binary",
##D              treat.type="multiple",
##D              search.lambdas=FALSE,
##D              lambdas=c(-15.000,-6.237))
##D 
##D ## Returns coefficient estimates.
##D summary(F2)
##D 
##D ## Returns predicted values for unique treatment combinations.
##D pred2 <- predict(F2,unique=TRUE)
##D ## Top 10
##D head(pred2$data, n=10)
##D ## Bottom 10
##D tail(pred2$data, n=10)
##D 
##D ## Visualize predicted values for each treatment combination.
##D plot(pred2)
## End(Not run)





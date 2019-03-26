library(BayesVarSel)


### Name: Bvs
### Title: Bayesian Variable Selection for linear regression models
### Aliases: Bvs
### Keywords: package

### ** Examples


## Not run: 
##D #Analysis of Crime Data
##D #load data
##D data(UScrime)
##D 
##D #Default arguments are Robust prior for the regression parameters
##D #and constant prior over the model space
##D #Here we keep the 1000 most probable models a posteriori:
##D crime.Bvs<- Bvs(formula= y ~ ., data=UScrime, n.keep=1000)
##D 
##D #A look at the results:
##D crime.Bvs
##D 
##D summary(crime.Bvs)
##D 
##D #A plot with the posterior probabilities of the dimension of the
##D #true model:
##D plot(crime.Bvs, option="dimension")
##D 
##D #Two image plots of the conditional inclusion probabilities:
##D plot(crime.Bvs, option="conditional")
##D plot(crime.Bvs, option="not")
## End(Not run)





library(BayesVarSel)


### Name: print.jointness
### Title: Print an object of class 'jointness'
### Aliases: print.jointness

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
##D jointness(crime.Bvs)
## End(Not run)





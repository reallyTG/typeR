library(KrigInv)


### Name: print_uncertainty_1d
### Title: Prints a measure of uncertainty for 1d function.
### Aliases: print_uncertainty_1d

### ** Examples

#print_uncertainty_1d

set.seed(9)
N <- 9 #number of observations
T <- c(-0.2,0.2) #thresholds
testfun <- sin
lower <- c(0)
upper <- c(6)

#a 20 points initial design
design <- data.frame( lower+(upper-lower)*matrix(runif(N),ncol=1) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design,
	response = response,covtype="matern3_2")

print_uncertainty_1d(model=model,T=T,lower=lower,upper=upper,
  main="probability of excursion",xlab="x",ylab="pn",
  cex.points=1.5,col.points.init="red",
  krigmeanplot=TRUE,Tplot=TRUE)

## Not run: 
##D uq1d <- print_uncertainty_1d(model=model,T=T,lower=lower,upper=upper,
##D   main="probability of excursion",xlab="x",ylab="pn",
##D   cex.points=1.5,col.points.init="red",
##D   krigmeanplot=TRUE,Tplot=TRUE,consQuantile =list(consLevel=0.95))
##D 
##D   print_uncertainty_1d(model=model,T=T,lower=lower,upper=upper,
##D   main="probability of excursion",xlab="x",ylab="pn",
##D   cex.points=1.5,col.points.init="red",
##D   krigmeanplot=TRUE,Tplot=TRUE,consQuantile =uq1d[2])
## End(Not run)





library(KrigInv)


### Name: print_uncertainty_2d
### Title: Prints a measure of uncertainty for 2d function.
### Aliases: print_uncertainty_2d

### ** Examples

#print_uncertainty_2d

set.seed(9)
N <- 20 #number of observations
T <- c(20,40) #thresholds
testfun <- branin
lower <- c(0,0)
upper <- c(1,1)

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design,
	response = response,covtype="matern3_2")

## Not run: 
##D print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D                      type="pn",krigmeanplot=TRUE,vorobmean=TRUE)
##D 
##D #print_uncertainty_2d(model=model,T=T,main="vorob uncertainty",
##D #type="vorob",krigmeanplot=FALSE)
##D 
##D #print_uncertainty_2d(model=model,T=T,main="imse uncertainty",
##D #type="imse",krigmeanplot=FALSE)
##D 
##D #print_uncertainty_2d(model=model,T=T,main="timse uncertainty",
##D #type="timse",krigmeanplot=FALSE)
##D 
##D ## Print uncertainty 2d and conservative estimate at level 0.95
##D # uq2d<- print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D #                     type="pn",krigmeanplot=TRUE,vorobmean=FALSE,
##D #                     consQuantile=list(consLevel=0.95))
##D # print_uncertainty_2d(model=model,T=T,main="probability of excursion",
##D #                     type="pn",krigmeanplot=TRUE,vorobmean=FALSE,
##D #                     consQuantile=uq2d[2])
## End(Not run)




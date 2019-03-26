library(KrigInv)


### Name: print_uncertainty
### Title: Prints a measure of uncertainty for a function of any dimension.
### Aliases: print_uncertainty

### ** Examples

#print_uncertainty

set.seed(9)
N <- 20 #number of observations
T <- c(80,100) #threshold
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

#you could do many plots, but only one is run here
print_uncertainty(model=model,T=T,main="probability of excursion",type="pn")
#print_uncertainty(model=model,T=T,main="Vorob'ev uncertainty",type="vorob")
#print_uncertainty(model=model,T=T,main="imse uncertainty",type="imse")
#print_uncertainty(model=model,T=T,main="timse uncertainty",type="timse")
#print_uncertainty(model=model,T=T,main="sur uncertainty",type="sur")
#print_uncertainty(model=model,T=T,main="probability of excursion",type="pn",
#vorobmean=TRUE)




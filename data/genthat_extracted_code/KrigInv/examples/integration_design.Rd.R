library(KrigInv)


### Name: integration_design
### Title: Construction of a sample of integration points and weights
### Aliases: integration_design

### ** Examples

#integration_design


#when nothing is specified: integration points 
#are chosen with the sobol sequence
integ.param <- integration_design(lower=c(0,0),upper=c(1,1))
plot(integ.param$integration.points)


#an example with pure random integration points
integcontrol <- list(distrib="MC",n.points=50)
integ.param <- integration_design(integcontrol=integcontrol,
		lower=c(0,0),upper=c(1,1))
plot(integ.param$integration.points)

#an example with important sampling distributions
#these distributions are used to compute integral criterion like
#"sur","timse" or "imse"

#for these, we need a kriging model
set.seed(9)
N <- 16;testfun <- branin
lower <- c(0,0);upper <- c(1,1)
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)
model <- km(formula=~., design = design, 
	response = response,covtype="matern3_2")
integcontrol <- list(distrib="sur",n.points=200,n.candidates=5000,
  init.distrib="MC")
  
T <- c(60,100) 
#we are interested in the set of points where the response is in [60,100]

integ.param <- integration_design(integcontrol=integcontrol,
		lower=c(0,0),upper=c(1,1), model=model,T=T)

print_uncertainty_2d(model=model,T=T,type="sur",
col.points.init="red",cex.points=2,
main="sur uncertainty and one sample of integration points")
points(integ.param$integration.points,pch=17,cex=1)




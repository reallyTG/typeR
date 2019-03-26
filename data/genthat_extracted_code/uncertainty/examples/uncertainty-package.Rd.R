library(uncertainty)


### Name: uncertainty-package
### Title: Uncertainty Estimation and Contribution Analysis
### Aliases: uncertainty-package
### Keywords: measurand modeling uncertainty budget estimating method

### ** Examples


require(mvtnorm)

cor.mat<- matrix(c(1,-0.7,-0.7,1),2,2)

u.budget<- uncertaintyBudget(x=list(name=c("x0","x1"), 
	mean=c(10,20), u=c(1,5), dof=c(10,10),
	label=c("x[0]", "x[1]"), distribution=c("normal","normal")), y=cor.mat)
u.budget


## Gaussian first order estimates
GFO.res<- uncertainty(x=u.budget,
y=list(measurand_name="ratio.GFO", 
measurand_label=expression(ratio[GFO]), 
measurand_model="x0/x1", 
method="GFO", alpha=0.05))

contr.GFO<- summary.uncertainty(GFO.res)

## Monte Carlo estimates
MC.res<- uncertainty(x=u.budget, 
y=list(measurand_name="ratio.MC", 
measurand_label=expression(ratio[MC]),
measurand_model="x0/x1", 
method="MC", alpha=0.05, B=1e5))

contr.MC<- summary.uncertainty(MC.res)

## print the estimates
MC.res
GFO.res

## print the uncertainty summary
contr.MC
contr.GFO

## Displaying both estimated distributions
## Not run: 
##D plot(MC.res, col=4, xlab=MC.res$measurand_model)
##D plot(GFO.res, lty=2, col=2, add=T)
##D legend(0.7, 2.5, legend=c("Monte Carlo", "Gaussian First Order"), 
##D lty=c(1,2), col=c(4,2), lwd=2, bg="white")
## End(Not run)

## Display both uncertainty summaries

## Not run: 
##D barplot(cbind(contr.GFO$budget$contrib, contr.MC$budget$contrib), 
##D beside=TRUE, horiz=TRUE, main="Uncertainty contribution by method",
##D xlab="percent Variance",
##D names.arg=c(GFO.res$measurand_label, MC.res$measurand_label))
## End(Not run)

##########################
## Example H.1 from GUM ##
##########################

# define the uncertainty budget

u.budget<- uncertaintyBudget(
  x=list(
    name=c("lambda.s", "alpha.s", "theta.bar", "Delta", "delta.alpha",
    "delta.theta", "d.bar", "d.cr",
	"d.cnr"),
    label=c("lambda[s]", "alpha[s]", "bar(theta)", "Delta", "delta[alpha]",
    "delta[theta]", "bar(d)", "d[cr]", "d[cnr]"),
    mean=c(50.000623,11.5e-6,-1e-1, 0, 0, 0, 2.15e-4, 0, 0),
    units=c("mm", "oC^-1","oC","oC", "oC^-1", "oC", "mm", "mm", "mm"),
    u=c(25e-6, 1.2e-6, 0.2, 0.35, 0.58e-6, 0.029, 5.8e-6, 3.9e-6, 6.7e-6),
    distribution=c("t","unif","unif","arcsine","unif","unif","t","t","t"),
    dof=c(18, 1, 1, 1, 50, 2, 24, 5, 8)
  ),
  y=diag(1, 9)
)

# define the measurand
measurand_name<- "lambda"
measurand_label<- "lambda"
measurand_model<- paste("(lambda.s*(1+alpha.s*(theta.bar+Delta+delta.theta))",
"+d.bar+d.cr+d.cnr)/(1+(alpha.s+delta.alpha)*(theta.bar+Delta))", sep="")

# estimate the measurand using the Gaussian First Order method (GUM)

u.GFO<- uncertainty(
	x=u.budget, 
	y=list(measurand_name=measurand_name, 
		measurand_label=measurand_label, 
		measurand_model=measurand_model,
		alpha=0.01,
		method="GFO"
	)
)

u.GFO
# same result as reported in Table H.1

# estimate the measurand using the Gaussian Second Order method

u.GSO<- uncertainty(
	x=u.budget, 
	y=list(measurand_name=measurand_name, 
		measurand_label=measurand_label, 
		measurand_model=measurand_model,
		alpha=0.01,
		method="GSO"
	)
) 

u.GSO
# same results as reported in section H.1.6, U(99) = 93 nm,
# the difference is due to rounding error.
# u = 34 nm, but dof are updated to 21 instead of keeping 16.

# estimate the measurand using the Monte Carlo method (GUM supplement 1)

u.MC<- uncertainty(
	x=u.budget, 
	y=list(measurand_name=measurand_name, 
		measurand_label=measurand_label, 
		measurand_model=measurand_model,
		alpha=0.01,
		method="MC", B=1e6
	)
) 

u.MC
# this result is not reported in the GUM

# estimate the measurand using the Kragten method

u.Kragten<- uncertainty(
	x=u.budget, 
	y=list(measurand_name=measurand_name, 
		measurand_label=measurand_label, 
		measurand_model=measurand_model,
		alpha=0.01,
		method="Kragten"
	)
) 

u.Kragten
# same as GFO results





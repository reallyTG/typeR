library(growthrate)


### Name: growth
### Title: recovery of growth velocities
### Aliases: growth
### Keywords: main program

### ** Examples

## Not run: 
##D ## example using the height data provided in the package
##D ## there are 7 observation times (age in years):
##D 	data(height_data);
##D 	tobs=c(0,1/3,2/3,1,3,4,7);
##D 	d=200;
##D 	sigma=1;
##D 	g=growth(height_data,tobs,sigma,d);
##D 
##D ## Plot of the posterior mean and credible interval for a specific individual
##D 	indiv=1;
##D ## posterior standard deviation (same for all subjects):
##D 	postsd=sqrt(diag(g$Khat));
##D 	plot(g$tgrid,g$muhatcurve[indiv,],type='l',
##D 			xlab="Age (years)",ylab="Growth velocity (cms/year)");
##D 	lines(g$tgrid,g$muhatcurve[indiv,]);
##D 	lines(g$tgrid,g$muhatcurve[indiv,]+2*postsd,lty=2);
##D 	lines(g$tgrid,g$muhatcurve[indiv,]-2*postsd,lty=2);
##D 
##D ## Plot of a draw from the posterior growth velocity for a specific individual:
##D 	draw=rmvnorm(n=1, mean=g$muhatcurve[indiv,], sigma=g$Khat, method="chol");
##D 	plot(g$tgrid,draw,type='l',xlab="Age (years)",ylab="Growth
##D 	velocity (cms/year)");
## End(Not run)




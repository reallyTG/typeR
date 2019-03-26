library(growthrate)


### Name: new.growth
### Title: recovery of growth velocity for a new subject
### Aliases: new.growth

### ** Examples

## Not run: 
##D ## example using the height data provided in the package 
##D ##    (after first running growth to obtain the output g):
##D ## suppose a new subject has 5 observation times (including 0 and 7)
##D 	data(height_data);
##D 	tobs=c(0,1/3,2/3,1,3,4,7);
##D 	d=200;
##D 	sigma=1;
##D 	g=growth(height_data,tobs,sigma,d);
##D 
##D 	newtobs=c(0, 2, 3, 5, 7);
##D 	newdata=t(as.vector(c(50,70,87,100,115)));
##D 	ng=new.growth(newdata,newtobs,sigma,d,g$muhatcurve,g$Khat,g$tgrid);
##D 
##D ## plot of the posterior mean growth velocity for the new subject:
##D 	plot(g$tgrid,ng$muhatcurvenew,xlab="Age (years)",ylab="Growth
##D 	velocity (cms/year)");
## End(Not run)




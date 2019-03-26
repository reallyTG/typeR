library(nsgp)


### Name: plot.gp
### Title: Plot a gaussian process
### Aliases: plot.gp

### ** Examples

# read toy data
data(toydata)

## Not run: 
##D can take several minutes
##D # perform one-sample regression
##D res = gpr2sample(toydata$ctrl$x, toydata$ctrl$y, seq(0,22,0.1))
##D 
##D # pre-computed model for toydata
##D data(toygps)
##D res = toygps$ctrlmodel
##D 
##D # basic plot with data, estimated mean and 95%
##D plot(res)
##D 
##D # don't plot the data, plot some samples drawn from the learned gp
##D plot(res, plotdata=FALSE, samples=3)
## End(Not run)




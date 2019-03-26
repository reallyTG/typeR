library(beast)


### Name: beast
### Title: Main function
### Aliases: beast

### ** Examples

# toy-example (MCMC iterations not enough)
library('beast')	# load package
data("FungalGrowthDataset")	# load dataset
myIndex <- c(392, 62, 3, 117)	# run the sampler only for the 
#                                 specific subset of time-series
set.seed(1)	
# Run MCMC sampler with very small number of iterations (nIter):
run_mcmc <- beast(myDataList = FungalGrowthDataset, subsetIndex = myIndex, 
			zeroNormalization = TRUE, nIter = 40, burn = 20) 
# Print output:
print(run_mcmc)
# Plot output to file: "beast_plot.pdf"
plot(run_mcmc, fileName = "beast_plot_toy.pdf", timeScale=1/6, xlab = "hours", ylab = "growth")
# Run the following commands to obtain convergence:

## Not run: 
##D # This example illustrates the package using a subset of four 
##D #      time-series of the fungal dataset. 
##D library('beast')	# load package
##D data("FungalGrowthDataset")	# load dataset
##D myIndex <- c(392, 62, 3, 117)	# run the sampler only for the 
##D #                                 specific subset of time-series
##D set.seed(1)		# optional
##D # Run MCMC sampler with the default number of iterations (nIter =70000):
##D run_mcmc <- beast(myDataList = FungalGrowthDataset, subsetIndex = myIndex, 
##D 			zeroNormalization = TRUE) 
##D # Print output:
##D print(run_mcmc)
##D # Plot output to file: "beast_plot.pdf"
##D plot(run_mcmc, fileName = "beast_plot.pdf", timeScale=1/6, xlab = "hours", ylab = "growth")
##D # NOTE 1: for a complete analysis remove the `subsetIndex = myIndex` argument.
##D # NOTE 2: `zeroNormalization = TRUE` is an optional argument that forces all 
##D #	   time-series to start from zero. It is not supposed to be used 
##D #	   for other applications.
## End(Not run)




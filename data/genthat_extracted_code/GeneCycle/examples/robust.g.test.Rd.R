library(GeneCycle)


### Name: robust.g.test
### Title: Robust g Test for Multiple (Genetic) Time Series
### Aliases: robust.g.test robust.spectrum
### Keywords: htest

### ** Examples

## Not run: 
##D 
##D # load GeneCycle library
##D library("GeneCycle")
##D 
##D # load data set
##D data(caulobacter)
##D 
##D # how many samples and and how many genes?
##D dim(caulobacter)
##D 
##D 
##D # robust, rank-based spectral estimator applied to first 5 genes
##D spe5 = robust.spectrum(caulobacter[,1:5])
##D 
##D # g statistics can be computed from the spectrum (internal use mostly 
##D # but can be checked here)
##D ## g.statistic(spe5)
##D 
##D # robust p-values, use Monte Carlo simulation (not permutation tests) 
##D # to estimate the null hypothesis distribution
##D pval = robust.g.test(spe5)  # generates a file with the name "g_pop_length_11.txt"
##D pval = robust.g.test(spe5)  # second call: much faster..
##D 
##D pval
##D 
##D # robust p-values, now look at index 4 (index can be anything from 1 
##D # (DC-level) to N (length of the time series and highest frequency))
##D pval = robust.g.test(spe5, 4)  # generates a file
##D pval = robust.g.test(spe5, 4)  # second call: much faster..
##D 
##D 
##D pval
##D 
##D # delete the external files 
##D unlink("g_pop_length_11.txt")
##D unlink("g_pop_length_11indexed.txt")
##D 
##D #
##D # Next let us see how the robust regression based approach can be 
##D # applied (Ahdesmaki et al. 2007)
##D # First: Unknown frequencies
##D t=c(0,15,30,45,60,75,90,105,120,135,150)
##D y = robust.spectrum(x=caulobacter[,1:5],algorithm="regression", t=t)
##D pvals = robust.g.test(y = y, perm=TRUE, x=caulobacter[,1:5], 
##D noOfPermutations = 50, algorithm = "regression", t=t)
##D  
##D pvals
##D 
##D #
##D # The following example illustrates how to use the regression based 
##D # method if we have prior knowledge about the frequency/period time
##D # of periodicity
##D t = 0:9 # time indices
##D t = t + runif(10)-0.5 # make time indices non-uniform
##D A = 0.5 * matrix(rnorm(50),10,5)       # create random time series (no outliers)
##D A[,5]=A[,5]+matrix(sin(0.5*pi*t),10,1) # superimpose a sinusoidal
##D periodicity.time=4                     # where to look for periodicity
##D # note that now the function robust.spectrum returns the p-values (in 
##D # all other cases it will return spectral estimates):
##D pvals=robust.spectrum(x=A,algorithm="regression", 
##D t=t,periodicity.time=periodicity.time, noOfPermutations=50)
##D pvals  # 5th p-value is smallish, as expected
##D 
## End(Not run)




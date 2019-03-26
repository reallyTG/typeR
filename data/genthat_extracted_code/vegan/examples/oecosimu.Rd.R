library(vegan)


### Name: oecosimu
### Title: Evaluate Statistics with Null Models of Biological Communities
### Aliases: oecosimu as.ts.oecosimu as.mcmc.oecosimu
### Keywords: multivariate datagen nonparametric

### ** Examples

## Use the first eigenvalue of correspondence analysis as an index
## of structure: a model for making your own functions.
data(sipoo)
## Traditional nestedness statistics (number of checkerboard units)
oecosimu(sipoo, nestedchecker, "r0")
## sequential model, one-sided test, a vector statistic
out <- oecosimu(sipoo, decorana, "swap", burnin=100, thin=10, 
   statistic="evals", alt = "greater")
out
## Inspect the swap sequence as a time series object
plot(as.ts(out))
lag.plot(as.ts(out))
acf(as.ts(out))
## Density plot
densityplot(permustats(out), as.table = TRUE, layout = c(1,4))
## Use quantitative null models to compare
## mean Bray-Curtis dissimilarities
data(dune)
meandist <- function(x) mean(vegdist(x, "bray"))
mbc1 <- oecosimu(dune, meandist, "r2dtable")
mbc1

## Define your own null model as a 'commsim' function: shuffle cells
## in each row
foo <- function(x, n, nr, nc, ...) {
   out <- array(0, c(nr, nc, n))
   for (k in seq_len(n))
      out[,,k] <- apply(x, 2, function(z) sample(z, length(z)))
   out
}
cf <- commsim("myshuffle", foo, isSeq = FALSE, binary = FALSE, 
   mode = "double")
oecosimu(dune, meandist, cf)

## Use pre-built null model
nm <- simulate(nullmodel(sipoo, "curveball"), 99)
oecosimu(nm, nestedchecker)
## Several chains of a sequential model -- this can be generalized
## for parallel processing (see ?smbind)
nm <- replicate(5, simulate(nullmodel(sipoo, "swap"), 99,
   thin=10, burnin=100), simplify = FALSE)
## nm is now a list of nullmodels: use smbind to combine these into one
## nullmodel with several chains
nm <- smbind(nm, MARGIN = 3)
nm
oecosimu(nm, nestedchecker)
## After this you can use as.mcmc() and tools in the coda package to
## analyse the chains (these will show that thin, burnin and nsimul are
## all too low for real analysis).




library(NMF)


### Name: profplot
### Title: Plotting Expression Profiles
### Aliases: profplot profplot.default
### Keywords: aplot

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# create a random target matrix
v <- rmatrix(50, 10)

# fit a single NMF model
res <- nmf(v, 3)
profplot(res)

# ordering according to first profile
profplot(res, Colv=1) # increasing
profplot(res, Colv=-1) # decreasing

# fit a multi-run NMF model
res2 <- nmf(v, 3, nrun=3)
profplot(res2)

# draw a profile correlation plot: this show how the basis components are
# returned in an unpredictable order
profplot(res, res2)

# looking at all the correlations allow to order the components in a "common" order
profcor(res, res2)




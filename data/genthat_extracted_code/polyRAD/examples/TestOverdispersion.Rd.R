library(polyRAD)


### Name: TestOverdispersion
### Title: Test the Fit of Read Depth to Beta-Binomial Distribution
### Aliases: TestOverdispersion TestOverdispersion.RADdata
### Keywords: distribution methods

### ** Examples

# dataset with overdispersion
data(Msi01genes)

# test several values for the overdispersion parameter
myP <- TestOverdispersion(Msi01genes, to_test = 8:10)

# visualize results with QQ plots
require(qqman)
qq(myP[["8"]])  # over-fit; too much overdispersion in model
qq(myP[["9"]])  # fairly close to expected; good value to use
qq(myP[["10"]]) # slightly under-fit; not enough overdispersion




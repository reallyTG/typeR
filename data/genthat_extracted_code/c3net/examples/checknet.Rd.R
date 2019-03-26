library(c3net)


### Name: checknet
### Title: Validating the inferred network
### Aliases: checknet
### Keywords: misc

### ** Examples

data(expdata)

data(truenet)

expdata <- copula(expdata)

mim <- makemim(expdata)

Ic <- 2  #Example cut-off value for mutual information for the first step of C3NET

mim[mim < Ic] <-0  #nonsignificant values eliminated wrt C3NET step 1.

net <- c3(mim)  # regulatory network inferred (non zero elements stand for links of
		# the predicted network)

scores <- checknet(net,truenet)




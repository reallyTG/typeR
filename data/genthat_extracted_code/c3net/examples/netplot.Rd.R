library(c3net)


### Name: netplot
### Title: Plotting the inferred network
### Aliases: netplot
### Keywords: misc

### ** Examples

data(expdata)

data(truenet)

expdata <- copula(expdata)

mim <- makemim(expdata)

Ic <- 2  #Example cut-off for the first step of C3NET

mim[mim < Ic] <-0  #nonsignificant values eliminated wrt C3NET step 1.

net <- c3(mim)  # regulatory network inferred (non zero elements stand for links of
		# the predicted network)

netplot(net)




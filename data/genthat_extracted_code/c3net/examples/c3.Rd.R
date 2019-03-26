library(c3net)


### Name: c3
### Title: C3NET second step: Selecting maximum valued elements
### Aliases: c3
### Keywords: misc

### ** Examples

data(expdata)

expdata <- copula(expdata)

mim <- makemim(expdata)

Ic <- mean(mim[upper.tri(mim)])  #Example cut-off for the first step of C3NET

# Ic <- 2 can be set for the example.

mim[mim < Ic] <-0  #nonsignificant values eliminated wrt C3NET step 1.

net <- c3(mim)  # regulatory network inferred (non zero elements stand for links of
		 #the predicted network)




library(tgp)


### Name: btgp
### Title: Bayesian Nonparametric & Nonstationary Regression Models
### Aliases: blm btlm bcart bgp bgpllm btgp btgpllm
### Keywords: nonparametric nonlinear smooth models regression spatial tree
###   optimize

### ** Examples

##
## Many of the examples below illustrate the above 
## function(s) on random data.  Thus it can be fun
## (and informative) to run them several times.
##

# 
# simple linear response
#

# input and predictive data
X <- seq(0,1,length=50)
XX <- seq(0,1,length=99)
Z <- 1 + 2*X + rnorm(length(X),sd=0.25)

out <- blm(X=X, Z=Z, XX=XX)	# try Linear Model
plot(out)			# plot the surface

#
# 1-d Example
# 

# construct some 1-d nonstationary data
X <- seq(0,20,length=100)
XX <- seq(0,20,length=99)
Z <- (sin(pi*X/5) + 0.2*cos(4*pi*X/5)) * (X <= 9.6)
lin <- X>9.6; 
Z[lin] <- -1 + X[lin]/10
Z <- Z + rnorm(length(Z), sd=0.1)

out <- btlm(X=X, Z=Z, XX=XX) 	# try Linear CART
plot(out) 			# plot the surface
tgp.trees(out) 		 	# plot the MAP trees

out <- btgp(X=X, Z=Z, XX=XX) 	# use a treed GP
plot(out) 			# plot the surface
tgp.trees(out) 		 	# plot the MAP trees


#
# 2-d example
# (using the isotropic correlation function)
#

# construct some 2-d nonstationary data
exp2d.data <- exp2d.rand()
X <- exp2d.data$X; Z <- exp2d.data$Z
XX <- exp2d.data$XX

# try a GP
out <- bgp(X=X, Z=Z, XX=XX, corr="exp") 	
plot(out) 			# plot the surface

# try a treed GP LLM
out <- btgpllm(X=X, Z=Z, XX=XX, corr="exp") 
plot(out) 			# plot the surface
tgp.trees(out) 		 	# plot the MAP trees


#
# Motorcycle Accident Data
#

# get the data
require(MASS)

# try a GP 
out <- bgp(X=mcycle[,1], Z=mcycle[,2])
plot(out)			# plot the surface

# try a treed GP LLM
# best to use the "b0" beta linear prior to capture common
# common linear process throughout all regions (using the
# ellipses "...") 
out <- btgpllm(X=mcycle[,1], Z=mcycle[,2], bprior="b0")
plot(out)			# plot the surface
tgp.trees(out)		 	# plot the MAP trees




library(qle)


### Name: QLmodel
### Title: Construct the quasi-likelihood approximation model
### Aliases: QLmodel

### ** Examples


data(normal)

# As an example we re-use the stored normal data and fit 
# a generalized covariance model to the data using simulation
# variances as local variances for REML estimation.
mods <- fitSIRFk(qsd$qldata, verbose=TRUE)

# construct QL approximation model
qsd <- QLmodel(qsd$qldata,qsd$lower,qsd$upper,
			    c("T1"=2,"T2"=1),mods)





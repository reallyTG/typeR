library(biwt)


### Name: biwt.est
### Title: A function to compute Tukey's biweight mean vector and
###   covariance matrix
### Aliases: biwt.est
### Keywords: robust multivariate cluster

### ** Examples



samp.data <- t(mvrnorm(30,mu=c(0,0),Sigma=matrix(c(1,.75,.75,1),ncol=2)))

samp.bw <- biwt.est(samp.data)
samp.bw

samp.bw.var1 <- samp.bw$biwt.sig[1,1]
samp.bw.var2 <- samp.bw$biwt.sig[2,2]
samp.bw.cov <- samp.bw$biwt.sig[1,2]

samp.bw.cor <- samp.bw.cov / sqrt(samp.bw.var1 * samp.bw.var2)
samp.bw.cor

# or:

samp.bw.cor <- samp.bw$biwt.sig[1,2] / 
	sqrt(samp.bw$biwt.sig[1,1]*samp.bw$biwt.sig[2,2])
samp.bw.cor

##############
# to speed up the calculations, use the median/mad for the initialization:
##############

samp.init <- list()
	samp.init$cov <- diag(apply(samp.data,1,mad,na.rm=TRUE))
	samp.init$center <- apply(samp.data,1,median,na.rm=TRUE)

samp.init

samp.bw <- biwt.est(samp.data,med.init = samp.init)
samp.bw.cor <- samp.bw$biwt.sig[1,2] / 
	sqrt(samp.bw$biwt.sig[1,1]*samp.bw$biwt.sig[2,2])
samp.bw.cor





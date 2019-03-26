library(qle)


### Name: reml
### Title: Restricted maximum likelihood (REML)
### Aliases: reml

### ** Examples

	data(normal)

 # extract the sample points (the design)
 X <- as.matrix(qsd$qldata[1:2])

 # get the observed statistic
 T <- qsd$qldata[c("mean.T1")]
 reml(qsd$covT[1],pars=c(1e-4,1.5,0.1),T,X)





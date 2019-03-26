library(CDVine)


### Name: BiCopChiPlot
### Title: Chi-plot for bivariate copula data
### Aliases: BiCopChiPlot

### ** Examples

## Not run: 
##D # chi-plots for bivariate Gaussian copula data
##D n = 500
##D tau = 0.5
##D 
##D # simulate copula data
##D fam = 1	
##D theta = BiCopTau2Par(fam,tau)
##D dat = BiCopSim(n,fam,theta)	
##D 
##D # create chi-plots
##D dev.new(width=16,height=5)
##D par(mfrow=c(1,3))
##D BiCopChiPlot(dat[,1],dat[,2],xlim=c(-1,1),ylim=c(-1,1),
##D              main="General chi-plot")
##D BiCopChiPlot(dat[,1],dat[,2],mode="lower",xlim=c(-1,1),
##D              ylim=c(-1,1),main="Lower chi-plot")
##D BiCopChiPlot(dat[,1],dat[,2],mode="upper",xlim=c(-1,1),
##D              ylim=c(-1,1),main="Upper chi-plot")
## End(Not run)




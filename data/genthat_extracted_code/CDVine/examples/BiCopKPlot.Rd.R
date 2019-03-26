library(CDVine)


### Name: BiCopKPlot
### Title: Kendall's plot (K-plot) for bivariate copula data
### Aliases: BiCopKPlot

### ** Examples

## Not run: 
##D # Gaussian and Clayton copulas
##D n = 500
##D tau = 0.5
##D 
##D # simulate from Gaussian copula
##D fam1 = 1	
##D theta1 = BiCopTau2Par(fam1,tau)
##D dat1 = BiCopSim(n,fam1,theta1)	
##D 
##D # simulate from Clayton copula
##D fam2 = 3
##D theta2 = BiCopTau2Par(fam2,tau)
##D dat2 = BiCopSim(n,fam2,theta2)
##D 
##D # create K-plots
##D dev.new(width=10,height=5)
##D par(mfrow=c(1,2))
##D BiCopKPlot(dat1[,1],dat1[,2],main="Gaussian copula")
##D BiCopKPlot(dat2[,1],dat2[,2],main="Clayton copula")
## End(Not run)




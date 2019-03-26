library(CDVine)


### Name: BiCopLambda
### Title: Lambda-function (plot) for bivariate copula data
### Aliases: BiCopLambda

### ** Examples

## Not run: 
##D # Clayton and rotated Clayton copulas
##D n = 1000
##D tau = 0.5
##D 
##D # simulate from Clayton copula
##D fam = 3	
##D theta = BiCopTau2Par(fam,tau)
##D dat = BiCopSim(n,fam,theta)
##D 
##D # create lambda-function plots
##D dev.new(width=16,height=5)
##D par(mfrow=c(1,3))
##D BiCopLambda(dat[,1],dat[,2])	# empirical lambda-function	
##D BiCopLambda(family=fam,par=theta)	# theoretical lambda-function
##D BiCopLambda(dat[,1],dat[,2],family=fam,par=theta)	# both
##D 
##D # simulate from rotated Clayton copula (90 degrees)
##D fam = 23  
##D theta = BiCopTau2Par(fam,-tau)
##D dat = BiCopSim(n,fam,theta)
##D 
##D # rotate the data to standard Clayton copula data
##D rot_dat = 1-dat[,1]
##D 
##D dev.new(width=16,height=5)
##D par(mfrow=c(1,3))
##D BiCopLambda(rot_dat,dat[,2])  # empirical lambda-function	
##D BiCopLambda(family=3,par=-theta)	# theoretical lambda-function
##D BiCopLambda(rot_dat,dat[,2],family=3,par=-theta)	# both
## End(Not run)




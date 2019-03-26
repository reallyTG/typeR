library(mtk)


### Name: setDistributionParameters-methods
### Title: The 'setDistributionParameters' method
### Aliases: setDistributionParameters-methods setDistributionParameters

### ** Examples


# 1)  Build an object of the "mtkDomain" class
	d <- mtkDomain(distributionName="unif", domainNominalValue=0)
	
	## Define the parameters
	p <- make.mtkParameterList(list(min=-pi, max=pi))
	
	## Assign the parameters to the mtkDomain's object

	setDistributionParameters(d, p)
# 2) Build an object of the "mtkDomain" class
	d <- mtkDomain(distributionName="unif", domainNominalValue=0)
	
	## Assign the parameters to the mtkDomain's object

	setDistributionParameters(d, list(min=-pi, max=pi))

# 3) Build an object of the "mtkDomain" class with a discrete distribution
	d <- mtkDomain(distributionName="discrete", domainNominalValue=0)

	## Assign the parameters to the mtkDomain's object

	setDistributionParameters(d, list(type='categorical', levels=seq(1:3), weights=rep(0.33,3)))




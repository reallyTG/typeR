library(mtk)


### Name: mtkDomain
### Title: The constructor of the class 'mtkDomain'
### Aliases: mtkDomain

### ** Examples


# creates a  new domain with a continue distribution
	d <- mtkDomain(distributionName="unif", domainNominalValue=0, 
			distributionParameters = list(max=3, min=0))
	
# creates a  new domain with a discrete distribution
	d <- mtkDomain(distributionName="discrete", domainNominalValue=3, 
			distributionParameters = list(type='categorical',
		 	levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
		




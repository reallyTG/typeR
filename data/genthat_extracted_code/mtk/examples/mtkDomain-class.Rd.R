library(mtk)


### Name: mtkDomain-class
### Title: The 'mtkDomain' class
### Aliases: mtkDomain-class initialize,mtkDomain-method
###   getDistributionName,mtkDomain-method
###   getNominalValueType,mtkDomain-method getNominalValue,mtkDomain-method
###   getDiscreteDistributionType,mtkDomain-method
###   setLevels,mtkDomain,list-method setLevels,mtkDomain,mtkLevels-method
###   getLevels,mtkDomain-method getWeights,mtkDomain-method
###   setDistributionParameters,mtkDomain,list-method
###   getDistributionParameters,mtkDomain-method print,mtkDomain-method
###   show,mtkDomain-method

### ** Examples

# Create a  new domain with a continue distribution
	d <- mtkDomain(distributionName="unif", domainNominalValue=0, 
		distributionParameters = list(max=3, min=0))
	
# Create a  new domain with a discrete distribution
	d <- mtkDomain(distributionName="discrete", domainNominalValue=3,
		 distributionParameters = list(type='categorical',
		 levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
# Change the levels to list(type='categorical', levels = c('a','b','c','d'), weights=rep(0.25, 4))
	setLevels(d, list(type='categorical', levels = c('a','b','c','d'), weights=rep(0.25, 4)))
		




library(mtk)


### Name: setLevels-methods
### Title: The 'setLevels' method
### Aliases: setLevels-methods setLevels

### ** Examples


# Create a  new mtkLevels for a discrete distribution

	l <- mtkLevels(type='categorical', levels = c(1,2,3,4,5), weights=rep(0.2, 5))
# Change the levels'name to ('a','b','c','d','e')
	setLevels(l, c('a','b','c','d','e'))
	
# Create a  new domain with a discrete distribution
	d <- mtkDomain(distributionName="discrete", domainNominalValue=3, 
			distributionParameters = list(type='categorical',
		 	levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
		 
# Create a  new mtkLevels for a discrete distribution and assign it to the domain

	l <- mtkLevels(type='categorical', levels = c('a','b','c','d','e'), weights=rep(0.2, 5))
	setLevels(d, l)

# Change the domain's levels to type='categorical', levels = c(5,4,3,2,1), weights=rep(0.2, 5)
	
	setLevels(d, levels=list(type='categorical', levels = c(5,4,3,2,1), weights=rep(0.2, 5)))




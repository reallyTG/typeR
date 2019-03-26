library(mtk)


### Name: setDomain-methods
### Title: The 'setDomain' method
### Aliases: setDomain-methods setDomain

### ** Examples

# Define a factor
	x1 <- make.mtkFactor(name="x1")

# Define a domain
	d <- mtkDomain(distributionName="unif", 
		 domainNominalValue=0, distributionParameters = list(max=3, min=0))
	
# Use the setDomain to change the domain of the factor
	setDomain(x1,d)




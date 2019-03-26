library(mtk)


### Name: getDomain-methods
### Title: The 'getDomain' method
### Aliases: getDomain-methods getDomain

### ** Examples

# Define a factor
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	
# Return the  uncertainty domain associated with the factor
	dom <- getDomain(x1)




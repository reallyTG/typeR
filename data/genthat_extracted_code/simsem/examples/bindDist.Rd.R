library(simsem)


### Name: bindDist
### Title: Create a data distribution object.
### Aliases: bindDist

### ** Examples

	
# Create data based on Vale and Maurelli's method by specifying skewness and kurtosis
dist <- bindDist(skewness = c(0, -2, 2), kurtosis = c(0, 8, 4))

## Not run: 
##D library(copula)
##D 
##D # Create three-dimensional distribution by gaussian copula with 
##D # the following marginal distributions
##D #   1. t-distribution with df = 2
##D # 	2. chi-square distribution with df = 3
##D #	3. normal distribution with mean = 0 and sd = 1
##D 
##D # Setting the attribute of each marginal distribution
##D d1 <- list(df=2)
##D d2 <- list(df=3)
##D d3 <- list(mean=0, sd=1)
##D 
##D # Create a data distribution object by setting the names of each distribution
##D # and their arguments
##D dist <- bindDist(c("t", "chisq", "norm"), d1, d2, d3)
##D 
##D # Create data by using Gumbel Copula as the multivariate distribution
##D dist <- bindDist(c("t", "chisq", "norm"), d1, d2, d3, copula = gumbelCopula(2, dim = 3))
##D 
##D # Reverse the direction of chi-square distribution from positively skew to negatively skew
##D dist <- bindDist(c("t", "chisq", "norm"), d1, d2, d3, copula = gumbelCopula(2, dim = 3),
##D 	reverse = c(FALSE, TRUE, FALSE))
## End(Not run)




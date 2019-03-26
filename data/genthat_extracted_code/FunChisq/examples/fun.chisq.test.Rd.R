library(FunChisq)


### Name: fun.chisq.test
### Title: Chi-Square and Exact Tests for Model-Free Functional Dependency
### Aliases: fun.chisq.test
### Keywords: htest nonparametric

### ** Examples

## Not run: 
##D # Example 1. Asymptotic functional chi-square test
##D x <- matrix(c(20,0,20,0,20,0,5,0,5), 3)
##D fun.chisq.test(x) # strong functional dependency
##D fun.chisq.test(t(x)) # weak functional dependency
##D 
##D # Example 2. Normalized functional chi-square test
##D x <- matrix(c(8,0,8,0,8,0,2,0,2), 3)
##D fun.chisq.test(x, method="nfchisq") # strong functional dependency
##D fun.chisq.test(t(x), method="nfchisq") # weak functional dependency
##D 
##D # Example 3. Exact functional chi-square test
##D x <- matrix(c(4,0,4,0,4,0,1,0,1), 3)
##D fun.chisq.test(x, method="exact") # strong functional dependency
##D fun.chisq.test(t(x), method="exact") # weak functional dependency
##D 
##D # Example 4. Exact functional chi-square test on a real data set
##D #            (Shen et al., 2002)
##D # x is a contingency table with row variable for p53 mutation and
##D #   column variable for CIMP
##D x <- matrix(c(12,26,18,0,8,12), nrow=2, ncol=3, byrow=TRUE)
##D 
##D # Test the functional dependency: p53 mutation -> CIMP
##D fun.chisq.test(x, method="exact")
##D 
##D # Test the functional dependency CIMP -> p53 mutation
##D fun.chisq.test(t(x), method="exact")
##D 
##D # Example 5. Asymptotic functional chi-square test with simulated distribution
##D x <- matrix(c(20,0,20,0,20,0,5,0,5), 3)
##D fun.chisq.test(x, method="simulate.p.value")
##D fun.chisq.test(x, method="simulate.p.value", simulate.n = 1000)
## End(Not run)




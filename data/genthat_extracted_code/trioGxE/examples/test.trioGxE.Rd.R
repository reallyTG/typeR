library(trioGxE)


### Name: test.trioGxE
### Title: Test of gene-environment interaction between a SNP and a
###   continuous non-genetic covariate from case-parent trio data.
### Aliases: test.trioGxE
### Keywords: methods

### ** Examples

data(hypoTrioDat)
example.fit <- trioGxE(hypoTrioDat, pgenos = c("parent1","parent2"), cgeno = "child",
                       cenv = "attr",penmod="codominant", k=c(5,5))
# A toy example with 'few' permutation replicates
example.test <- test.trioGxE(example.fit, nreps=10, early.stop = FALSE, 
                              output=NULL)
 

## Not run: 
##D 
##D ## More proper examples of permutation tests with 5000 replicates
##D 
##D ## Example1: does not generate an output file containing test statistic values
##D example.test1 <- test.trioGxE(example.fit, nreps=5000, early.stop = TRUE, 
##D                               output=NULL)
##D ## Example 2: generates an output file 'myoutput.out' containing test statistic values 
##D example.test2 <- test.trioGxE(example.fit, nreps=5000, early.stop = TRUE, 
##D                               output="myoutput.out")
## End(Not run)




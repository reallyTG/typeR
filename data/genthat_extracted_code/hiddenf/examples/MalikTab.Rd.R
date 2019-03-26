library(hiddenf)


### Name: MalikTab
### Title: Malik's critical values
### Aliases: MalikTab
### Keywords: non-additivity

### ** Examples

# get critical values to conduct Malik's test of additivity
# in an experiment with row and column factors with 4 and 5 levels,
# respectively
## Not run: 
##D data(cjejuni.mtx)
##D cjejuni.out <- HiddenF(cjejuni.mtx)
##D Malik.pvalue <- MalikPvalue(cjejuni.out)
##D cjejuni.Malikobj <- Maliktab(4,5,N=1000)
##D print(cjejuni.Malikobj$q)
## End(Not run)



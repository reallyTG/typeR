library(biclust)


### Name: diagnosticTest
### Title: Testing Procedure for Bicluster Diagnostics
### Aliases: diagnosticTest

### ** Examples

## Don't show: 
test <- matrix(rnorm(5000),100,50)
roweff <- sample(1:5,10,replace=TRUE)
coleff <- sample(1:5,10,replace=TRUE)
test[11:20,11:20] <- test[11:20,11:20] +
  matrix(coleff,nrow=10,ncol=10,byrow=TRUE) +
  matrix(roweff,nrow=10,ncol=10) +
  roweff %*% t(coleff)


#Apply Plaid Biclustering
res <- biclust(test, method=BCPlaid())

#Apply default diagnosticTest
out <- diagnosticTest(BCresult=res, data=test, save_F=TRUE, number=1,
                      statistics=c("F","Tukey"),
                      samplingtypes=c("Permutation","SemiparPerm"))
## End(Don't show)

## Not run: 
##D #Random matrix with embedded bicluster (with multiplicative effect)
##D test <- matrix(rnorm(5000),100,50)
##D roweff <- sample(1:5,10,replace=TRUE)
##D coleff <- sample(1:5,10,replace=TRUE)
##D test[11:20,11:20] <- test[11:20,11:20] +
##D   matrix(coleff,nrow=10,ncol=10,byrow=TRUE) +
##D   matrix(roweff,nrow=10,ncol=10) +
##D   roweff %*% t(coleff)
##D 
##D 
##D #Apply Plaid Biclustering
##D res <- biclust(test, method=BCPlaid())
##D 
##D #Apply default diagnosticTest
##D out <- diagnosticTest(BCresult=res, data=test, save_F=TRUE, number=1,
##D                       statistics=c("F","Tukey","ModTukey","Tusell","Mandel","LBI","JandG"),
##D                       samplingtypes=c("Permutation","SemiparPerm","SemiparBoot",
##D                       "PermutationCor","SamplingCor","NormSim"))
##D 
##D out[[1]]$table
## End(Not run)





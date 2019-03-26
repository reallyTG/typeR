library(mvctm)


### Name: permcluster
### Title: Generates a Permuted Data Set
### Aliases: permcluster

### ** Examples


data(toydata)

# generates a permuted data set with 2-level data

permcluster(cluster=c("classroom"),data=toydata,leveltested=1)

# generates a permuted data set with 4-level data to test for level 2

permcluster(cluster=c("region","school","classroom"),
data=toydata,leveltested=2)

# performing a permutation test with another
# test statistic might look like this

## Not run: 
##D pval=0
##D # compute the statistic with the original data. Call in stato.
##D for (i in 1:npermut)
##D {
##D pdata=permcluster(cluster=c("classroom"),data=toydata,leveltested=1)
##D # compute the statistic with pdata using the new column
##D # clusperm1 instead of classroom as the cluster index.
##D # call it statp.
##D pval=pval+(statp>stato)
##D }
##D pval/npermut
## End(Not run)





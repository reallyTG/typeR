library(T2EQ)


### Name: T2EQ.dissolution.profiles.hoffelder
### Title: The T^2-test for equivalence for dissolution data
### Aliases: T2EQ.dissolution.profiles.hoffelder
### Keywords: multivariate robust

### ** Examples

## Not run: 
##D A recalculation of the results underlying Figure 1 in Hoffelder (2016) 
##D can be done with the following code:
## End(Not run)

data(ex_data_pharmind)
REF_pharmind <- cbind(ex_data_pharmind[ which(ex_data_pharmind$Group=='REF'), ]
                  [c("Diss_10_min","Diss_20_min","Diss_30_min")])
TEST_pharmind <- cbind(ex_data_pharmind[ which(ex_data_pharmind$Group=='TEST'), ]
                  [c("Diss_10_min","Diss_20_min","Diss_30_min")])
test_T2EQ.dissolution.profiles.hoffelder_pharmind <- 
      T2EQ.dissolution.profiles.hoffelder(X=REF_pharmind,Y=TEST_pharmind)




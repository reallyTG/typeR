library(T2EQ)


### Name: T2EQ-package
### Title: Functions for Applying the T^2-Test for Equivalence
### Aliases: T2EQ-package
### Keywords: package multivariate robust

### ** Examples

## Not run: 
##D A recalculation of the example evaluation in Hoffelder et al. (2015) 
##D can be done with the following code:
## End(Not run)

data(ex_data_JoBS)
REF_JoBS <- cbind(ex_data_JoBS[ which(ex_data_JoBS$Group=='REF'), ]
            [c("Diss_15_min","Diss_20_min","Diss_25_min")])
TEST_JoBS <- cbind(ex_data_JoBS[ which(ex_data_JoBS$Group=='TEST'), ]
            [c("Diss_15_min","Diss_20_min","Diss_25_min")])
equivalence_margin_JoBS <- 0.74^2
test_T2EQ_JoBS <- T2EQ(X=REF_JoBS,Y=TEST_JoBS,eq_margin = equivalence_margin_JoBS)

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





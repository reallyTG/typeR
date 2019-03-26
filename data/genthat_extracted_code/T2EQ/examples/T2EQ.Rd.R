library(T2EQ)


### Name: T2EQ
### Title: Function for applying the T^2-test for equivalence
### Aliases: T2EQ
### Keywords: multivariate robust

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




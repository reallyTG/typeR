library(robmed)


### Name: p_value
### Title: p-Values for (robust) mediation analysis
### Aliases: p_value p_value.boot_test_mediation
###   p_value.sobel_test_mediation
### Keywords: utilities

### ** Examples

data("BSG2014")

## Not run: 
##D # BCa intervals are recommended, but take a while to run
##D test_bca <- test_mediation(BSG2014,
##D                            x = "ValueDiversity",
##D                            y = "TeamCommitment",
##D                            m = "TaskConflict",
##D                            type = "bca")
##D p_value(test_bca)
## End(Not run)





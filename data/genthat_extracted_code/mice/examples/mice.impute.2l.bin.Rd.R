library(mice)


### Name: mice.impute.2l.bin
### Title: Imputation by a two-level logistic model using 'glmer'
### Aliases: mice.impute.2l.bin
### Keywords: datagen

### ** Examples

library(tidyr)
library(dplyr)
data("toenail", package = "HSAUR3")
data <- tidyr::complete(toenail, patientID, visit) %>% 
 tidyr::fill(treatment) %>% 
 dplyr::select(-time) %>%
 dplyr::mutate(patientID = as.integer(patientID))

## Not run: 
##D pred <- mice(data, print = FALSE, maxit = 0, seed = 1)$pred
##D pred["outcome", "patientID"] <- -2
##D imp <- mice(data, method = "2l.bin", pred = pred, maxit = 1, m = 1, seed = 1)
## End(Not run)




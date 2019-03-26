library(CALIBERrfimpute)


### Name: setRFoptions
### Title: Set Random Forest options for imputation using MICE
### Aliases: setRFoptions

### ** Examples

# Set option using setRFoptions
setRFoptions(ntree_cat=15)
options()$CALIBERrfimpute_ntree_cat

# Set option directly
options(CALIBERrfimpute_ntree_cat=20)
options()$CALIBERrfimpute_ntree_cat




library(prcbench)


### Name: create_toolset
### Title: Create a set of tools
### Aliases: create_toolset

### ** Examples

## Create ROCR and precrec
toolset1 <- create_toolset(c("ROCR", "precrec"))
toolset1

## Create auc5 tools
toolset2 <- create_toolset(set_names = "auc5")
toolset2





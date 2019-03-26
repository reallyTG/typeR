library(unitizer)


### Name: conditionList
### Title: Contains A List of Conditions
### Aliases: conditionList conditionList-class

### ** Examples

## Create a test item as you would find normally at the `unitizer` prompt
## for illustrative purposes:
.NEW <- mock_item()
## Access the first condition from the new test evaluation
.NEW$conditions[[1L]]
## loop through all conditions
for(i in seq_along(.NEW$conditions)) .NEW$conditions[[i]]




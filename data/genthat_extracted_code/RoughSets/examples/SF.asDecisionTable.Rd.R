library(RoughSets)


### Name: SF.asDecisionTable
### Title: Converting a data.frame into a 'DecisionTable' object
### Aliases: SF.asDecisionTable

### ** Examples

################################################################
## Example : converting from datasets in data.frame
##            into decision table
################################################################
## Let use iris which is available in R be dataset
decision.table <- SF.asDecisionTable(dataset = iris, decision.attr = 5,
                  indx.nominal = 5)




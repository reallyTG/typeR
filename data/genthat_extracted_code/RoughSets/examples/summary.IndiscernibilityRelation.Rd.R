library(RoughSets)


### Name: summary.IndiscernibilityRelation
### Title: The summary function for an indiscernibility relation
### Aliases: summary.IndiscernibilityRelation

### ** Examples

###########################################################
## Example 1: Dataset containing nominal values for
## all attributes.
###########################################################
## Decision table is represented as data frame
dt.ex1 <- data.frame(c(1,0,2,1,1,2,2,0), c(0, 1,0, 1,0,2,1,1),
                        c(2,1,0,0,2,0,1,1), c(2,1,1,2,0,1,1,0), c(0,2,1,2,1,1,2,1))
colnames(dt.ex1) <- c("aa", "bb", "cc", "dd", "ee")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 5)

## In this case, we only consider the second and third attributes.
attributes <- c(2, 3)

#### calculate fuzzy indiscernibility relation ####
## in this case, we are using "crisp" as a type of relation and type of aggregation
control.ind <- list(type.relation = c("crisp"), type.aggregation = c("crisp"))
IND <- BC.IND.relation.FRST(decision.table, attributes = attributes, control = control.ind)

summary(IND)




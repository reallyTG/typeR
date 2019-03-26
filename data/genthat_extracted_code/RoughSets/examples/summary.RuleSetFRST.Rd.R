library(RoughSets)


### Name: summary.RuleSetFRST
### Title: The summary function of rules based on FRST
### Aliases: summary.RuleSetFRST

### ** Examples

###########################################################
## Example 1: Regression problem
###########################################################
data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

control <- list(type.aggregation = c("t.tnorm", "lukasiewicz"), type.relation =
                c("tolerance", "eq.3"), t.implicator = "lukasiewicz")
res.1 <- RI.hybridFS.FRST(decision.table, control)

summary(res.1)
###########################################################
## Example 2: Classification problem
##############################################################
data(RoughSetData)
decision.table <- RoughSetData$pima7.dt

control <- list(type.aggregation = c("t.tnorm", "lukasiewicz"), type.relation =
                c("tolerance", "eq.3"), t.implicator = "lukasiewicz")
res.2 <- RI.hybridFS.FRST(decision.table, control)

summary(res.2)




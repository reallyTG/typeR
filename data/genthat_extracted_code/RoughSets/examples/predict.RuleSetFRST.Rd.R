library(RoughSets)


### Name: predict.RuleSetFRST
### Title: The predicting function for rule induction methods based on FRST
### Aliases: predict.FRST predict.RuleSetFRST

### ** Examples

##############################################
## Example: Classification Task
##############################################
data(RoughSetData)
decision.table <- RoughSetData$pima7.dt

## using RI.hybrid.FRST for generating rules
control <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
           type.relation = c("tolerance", "eq.1"), t.implicator = "lukasiewicz")
rules.hybrid <- RI.hybridFS.FRST(decision.table, control)

## in this case, we are using the same data set as the training data
res.1 <- predict(rules.hybrid, decision.table[, -ncol(decision.table)])

## using RI.GFRS.FRST for generating rules
control <- list(alpha.precision = 0.01, type.aggregation = c("t.tnorm", "lukasiewicz"),
                type.relation = c("tolerance", "eq.3"), t.implicator = "lukasiewicz")
rules.gfrs <- RI.GFRS.FRST(decision.table, control)

## in this case, we are using the same data set as the training data
res.2 <- predict(rules.gfrs, decision.table[, -ncol(decision.table)])

##############################################
## Example: Regression Task
##############################################
data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

## using RI.hybrid.FRST for generating rules
control <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
           type.relation = c("tolerance", "eq.1"), t.implicator = "lukasiewicz")
rules <- RI.hybridFS.FRST(decision.table, control)

## in this case, we are using the same data set as the training data
res.1 <- predict(rules, decision.table[, -ncol(decision.table)])




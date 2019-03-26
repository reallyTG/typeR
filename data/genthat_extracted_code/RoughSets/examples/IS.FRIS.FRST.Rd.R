library(RoughSets)


### Name: IS.FRIS.FRST
### Title: The fuzzy rough instance selection algorithm
### Aliases: IS.FRIS.FRST

### ** Examples

#############################################
## Example: Evaluate instances/objects and
##          generate new decision table
#############################################
dt.ex1 <- data.frame(c(0.1, 0.5, 0.2, 0.3, 0.2, 0.2, 0.8),
                  c(0.1, 0.1, 0.4, 0.2, 0.4, 0.4, 0.5), c(0, 0, 0, 0, 1, 1, 1))
colnames(dt.ex1) <- c("a1", "a2", "d")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 3, indx.nominal = c(3))

## evaluate index of objects
res.1 <- IS.FRIS.FRST(decision.table = decision.table, control =
                        list(threshold.tau = 0.5, alpha = 0.8,
                        type.aggregation = c("t.tnorm", "lukasiewicz"),
                        t.implicator = "lukasiewicz"))

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, res.1)




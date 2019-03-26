library(RoughSets)


### Name: RI.GFRS.FRST
### Title: Generalized fuzzy rough set rule induction based on FRST
### Aliases: RI.GFRS.FRST

### ** Examples

###########################################################
## Example
##############################################################
data(RoughSetData)
decision.table <- RoughSetData$pima7.dt

control <- list(alpha.precision = 0.01, type.aggregation = c("t.tnorm", "lukasiewicz"),
                type.relation = c("tolerance", "eq.3"), t.implicator = "lukasiewicz")
rules <- RI.GFRS.FRST(decision.table, control)




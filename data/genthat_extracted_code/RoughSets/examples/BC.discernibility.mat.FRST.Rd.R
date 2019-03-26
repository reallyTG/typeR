library(RoughSets)


### Name: BC.discernibility.mat.FRST
### Title: The decision-relative discernibility matrix based on fuzzy rough
###   set theory
### Aliases: BC.discernibility.mat.FRST

### ** Examples

#######################################################################
## Example 1: Constructing the decision-relative discernibility matrix
## In this case, we are using The simple Pima dataset containing 7 rows.
#######################################################################
data(RoughSetData)
decision.table <- RoughSetData$pima7.dt

## using "standard.red"
control.1 <- list(type.relation = c("tolerance", "eq.1"),
                type.aggregation = c("t.tnorm", "min"),
                t.implicator = "kleene_dienes", type.LU = "implicator.tnorm")
res.1 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "standard.red",
                                    control = control.1)

## using "gaussian.red"
control.2 <- list(epsilon = 0)
res.2 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "gaussian.red",
                                    control = control.2)

## using "alpha.red"
control.3 <- list(type.relation = c("tolerance", "eq.1"),
                type.aggregation = c("t.tnorm", "min"),
                t.implicator = "lukasiewicz", alpha.precision = 0.05)
res.3 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "alpha.red",
                                    control = control.3)

## using "min.element"
control.4 <- list(type.relation = c("tolerance", "eq.1"),
                type.aggregation = c("t.tnorm", "lukasiewicz"),
                t.implicator = "lukasiewicz", type.LU = "implicator.tnorm")
res.4 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "min.element",
                                    control = control.4)

#######################################################################
## Example 2: Constructing the decision-relative discernibility matrix
## In this case, we are using the Hiring dataset containing nominal values
#######################################################################
## Not run: 
##D data(RoughSetData)
##D decision.table <- RoughSetData$hiring.dt
##D 
##D control.1 <- list(type.relation = c("crisp"),
##D                 type.aggregation = c("crisp"),
##D                 t.implicator = "lukasiewicz", type.LU = "implicator.tnorm")
##D res.1 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "standard.red",
##D                                     control = control.1)
##D 
##D control.2 <- list(epsilon = 0)
##D res.2 <- BC.discernibility.mat.FRST(decision.table, type.discernibility = "gaussian.red",
##D                                     control = control.2)
## End(Not run)




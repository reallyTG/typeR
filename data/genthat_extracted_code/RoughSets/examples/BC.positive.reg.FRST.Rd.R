library(RoughSets)


### Name: BC.positive.reg.FRST
### Title: Positive region based on fuzzy rough set
### Aliases: BC.positive.reg.FRST

### ** Examples

###########################################################
##### 1. Example: Using a simple decision table containing
#####             nominal values for the decision attribute
###########################################################
dt.ex1 <- data.frame(c(-0.4, -0.4, -0.3, 0.3, 0.2, 0.2),
                     c(-0.3, 0.2, -0.4, -0.3, -0.3, 0),
				        c(-0.5, -0.1, -0.3, 0, 0, 0),
				        c("no", "yes", "no", "yes", "yes", "no"))
colnames(dt.ex1) <- c("a", "b", "c", "d")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 4)

## let us consider the first and second attributes only as conditional attribute
condAttr <- c(1, 2)

## let us consider the fourth attribute as decision attribute
decAttr <- c(4)

#### Calculate fuzzy indiscernibility relation ####
control.ind <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                    type.relation = c("tolerance", "eq.1"))
control.dec <- list(type.aggregation = c("crisp"), type.relation = "crisp")

IND.condAttr <- BC.IND.relation.FRST(decision.table, attributes = condAttr,
                                     control = control.ind)
IND.decAttr <- BC.IND.relation.FRST(decision.table, attributes = decAttr,
                                     control = control.dec)

#### Calculate fuzzy lower and upper approximation using type.LU :
#### "implicator.tnorm"
control <- list(t.implicator = "lukasiewicz")
FRST.LU <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "implicator.tnorm", control = control)

#### Determine positive regions ####
res.1 <- BC.positive.reg.FRST(decision.table, FRST.LU)

###########################################################
##### 2. Example: Using the housing decision table containing
#####             continuous values for the decision attribute
###########################################################

## In this case, we are using the housing dataset containing 7 objects
data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

conditional.attr <- c(1, 2)
decision.attr = c(14)
control.ind <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                     type.relation = c("tolerance", "eq.1"))

#### Calculate fuzzy indiscernibility relation ####
IND.condAttr <- BC.IND.relation.FRST(decision.table, attributes = conditional.attr,
                                     control = control.ind)
IND.decAttr <- BC.IND.relation.FRST(decision.table, attributes = decision.attr,
                                     control = control.ind)

#### Calculate fuzzy lower and upper approximation using type.LU :
#### "implicator.tnorm"
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz")

FRST.LU <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "implicator.tnorm", control = control)

#### Determine fuzzy regions ####
res.2 <- BC.positive.reg.FRST(decision.table, FRST.LU)




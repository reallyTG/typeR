library(RoughSets)


### Name: BC.LU.approximation.FRST
### Title: The fuzzy lower and upper approximations based on fuzzy rough
###   set theory
### Aliases: BC.LU.approximation.FRST

### ** Examples

###########################################################
## 1. Example: Decision table contains nominal decision attribute
## we are using the same dataset and indiscernibility
## relation along this example.
###########################################################
dt.ex1 <- data.frame(c(-0.4, -0.4, -0.3, 0.3, 0.2, 0.2),
                     c(-0.3, 0.2, -0.4, -0.3, -0.3, 0),
				        c(-0.5, -0.1, -0.3, 0, 0, 0),
				        c("no", "yes", "no", "yes", "yes", "no"))
colnames(dt.ex1) <- c("a", "b", "c", "d")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 4)

## let us consider the first and second attributes
## only as conditional attributes
condAttr <- c(1, 2)

## let us consider the fourth attribute as decision attribute
decAttr <- c(4)

#### calculate fuzzy indiscernibility relation ####
control.ind <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                    type.relation = c("tolerance", "eq.1"))
control.dec <- list(type.aggregation = c("crisp"), type.relation = "crisp")

## fuzzy indiscernibility relation of conditional attribute
IND.condAttr <- BC.IND.relation.FRST(decision.table, attributes = condAttr,
                                     control = control.ind)

## fuzzy indiscernibility relation of decision attribute
IND.decAttr <- BC.IND.relation.FRST(decision.table, attributes = decAttr,
                                     control = control.dec)

#### Calculate fuzzy lower and upper approximation using type.LU : "implicator.tnorm" ####
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz")
FRST.LU <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "implicator.tnorm", control = control)

#### Calculate fuzzy lower and upper approximation using type.LU : "vqrs" ####
control <- list(q.some = c(0.1, 0.6), q.most = c(0.2, 1), t.tnorm = "lukasiewicz")
FRST.VQRS <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "vqrs", control = control)

#### Calculate fuzzy lower and upper approximation using type.LU : "owa" ####
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz", m.owa = 3)
FRST.OWA.1 <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "owa", control = control)

#### Calculate fuzzy lower and upper approximation using type.LU :
#### "owa" with customized function
#### In this case, we are using the same weight vector as
#### previous one with m.owa = 3
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz",
               w.owa =  c(0, 0, 0, 0.14, 0.29, 0.57))
FRST.OWA.2 <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "owa", control = control)

#### Calculate fuzzy lower and upper approximation using type.LU : "fvprs" ####
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz", alpha = 0.05)
FRST.fvprs <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "fvprs", control = control)


#### Calculate fuzzy lower and upper approximation using type.LU : "rfrs" ####
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz",
                type.rfrs = "k.trimmed.min", k.rfrs = 0)
FRST.rfrs <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "rfrs", control = control)

#### Calculate fuzzy lower and upper approximation using type.LU : "beta.pfrs" ####
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz", beta.quasi = 0.05)
FRST.beta.pfrs <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "beta.pfrs", control = control)

#### Calculate fuzzy lower and upper approximation using type.LU : "custom" ####
## In this case, we calculate approximations randomly.
f.lower <- function(x){
        return(min(runif(1, min = 0, max = 1) * x))
}
f.upper <- function(x){
        return(max(runif(1, min = 0, max = 1) * x))
}
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz", FUN.lower = f.lower,
                FUN.upper = f.upper)
FRST.custom <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "custom", control = control)

#### In this case, we use custom function for triangular norm and implicator operator
## For example, let us define our implicator and t-norm operator as follows.
imp.lower <- function(antecedent, consequent){
	                 return(max(1 - antecedent, consequent))
              }
tnorm.upper <- function(x, y){
                return (x * y)
             }
control.custom <- list(t.implicator = imp.lower, t.tnorm = tnorm.upper)
FRST.LU.custom <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "implicator.tnorm", control = control.custom)

###########################################################
## 2. Example: Decision table contains a continuous decision attribute.
## It should be noted that in this example, we are using
## the same dataset and indiscernibility relation.
## We only show one method but for other approaches
## the procedure is analogous to the previous example
###########################################################
## In this case, we are using housing dataset containing 7 objects
data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

## let us consider the first and second conditional attributes only,
## and the decision attribute at 14.
cond.attributes <- c(1, 2)
dec.attributes <- c(14)
control.ind <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
               type.relation = c("tolerance", "eq.1"))
IND.condAttr <- BC.IND.relation.FRST(decision.table, attributes = cond.attributes,
                                     control = control.ind)
IND.decAttr <- BC.IND.relation.FRST(decision.table, attributes = dec.attributes,
                                    control = control.ind)

#### Calculate fuzzy lower and upper approximation using type.LU : "implicator.tnorm" ####
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz")
FRST.LU <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "implicator.tnorm", control = control)




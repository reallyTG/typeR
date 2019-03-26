library(RoughSets)


### Name: BC.IND.relation.FRST
### Title: The indiscernibility relation based on fuzzy rough set theory
### Aliases: BC.IND.relation.FRST

### ** Examples

###########################################################
## Example 1: Dataset containing nominal values for
## all attributes.
###########################################################
## Decision table is represented as data frame
dt.ex1 <- data.frame(c(1,0,2,1,1,2,2,0), c(0, 1,0, 1,0,2,1,1),
                        c(2,1,0,0,2,0,1,1), c(2,1,1,2,0,1,1,0), c(0,2,1,2,1,1,2,1))
colnames(dt.ex1) <- c("aa", "bb", "cc", "dd", "ee")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 5,
      indx.nominal = c(1:5))

## In this case, we only consider the second and third attributes.
attributes <- c(2, 3)

## calculate fuzzy indiscernibility relation ##
## in this case, we are using "crisp" as a type of relation and type of aggregation
control.ind <- list(type.relation = c("crisp"), type.aggregation = c("crisp"))
IND <- BC.IND.relation.FRST(decision.table, attributes = attributes, control = control.ind)

###########################################################
## Example 2: Dataset containing real-valued attributes
###########################################################
dt.ex2 <- data.frame(c(-0.4, -0.4, -0.3, 0.3, 0.2, 0.2),
                     c(-0.3, 0.2, -0.4, -0.3, -0.3, 0),
				        c(-0.5, -0.1, -0.3, 0, 0, 0),
				        c("no", "yes", "no", "yes", "yes", "no"))
colnames(dt.ex2) <- c("a", "b", "c", "d")
decision.table <- SF.asDecisionTable(dataset = dt.ex2, decision.attr = 4)

## in this case, we only consider the first and second attributes
attributes <- c(1, 2)

## Calculate fuzzy indiscernibility relation
## in this case, we choose "tolerance" relation and "eq.1" as similarity equation
## and "lukasiewicz" as t-norm of type of aggregation
control.1 <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                    type.relation = c("tolerance", "eq.1"))
IND.1 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.1)

## Calculate fuzzy indiscernibility relation: transitive.kernel
control.2 <- list(type.aggregation = c("t.tnorm", "t.cos"),
                    type.relation = c("transitive.kernel", "gaussian", 0.2))
IND.2 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.2)

## Calculate fuzzy indiscernibility relation: kernel.frst
control.3 <- list(type.relation = c("kernel.frst", "gaussian.kernel", 0.2))
IND.3 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.3)

## calculate fuzzy transitive closure
control.4 <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                    type.relation = c("transitive.closure", "eq.1"))
IND.4 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.4)

## Calculate fuzzy indiscernibility relation: using user-defined relation
## The customized function should have three arguments which are : decision.table
## and object x, and y.
## This following example shows that we have an equation for similarity equation:
## 1 - abs(x - y) where x and y are two objects that will be compared.
## In this case, we do not consider decision.table in calculation.
FUN.relation <- function(decision.table, x, y) {
           return(1 - (abs(x - y)))
       }
control.5 <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                     type.relation = c("custom", FUN.relation))
IND.5 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.5)

## In this case, we calculate aggregation as average of all objects
## by executing the Reduce function
FUN.average <- function(data){
  	 return(Reduce("+", data)/length(data))
}
control.6 <- list(type.aggregation = c("custom", FUN.average),
                     type.relation = c("tolerance", "eq.1"))
IND.6 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.6)

## using user-defined tnorms
FUN.tnorm <- function(left.side, right.side) {
               if ((left.side + right.side) > 1)
                   return(min(left.side, right.side))
               else return(0)}
control.7 <- list(type.aggregation = c("t.tnorm", FUN.tnorm),
                    type.relation = c("tolerance", "eq.1"))
IND.7 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.7)

## Calculate fuzzy indiscernibility relation: kernel fuzzy rough set
control.8 <- list(type.relation = c("kernel.frst", "gaussian.kernel", 0.2))
IND.8 <- BC.IND.relation.FRST(decision.table, attributes = attributes,
                              control = control.8)
##################################################################
## Example 3: Dataset containing continuous and nominal attributes
## Note. we only consider type.relation = c("tolerance", "eq.1")
## but other approaches have the same way.
##################################################################
data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

## in this case, we only consider the attribute: 1, 2, 3, 4
attributes <- c(1,2,3,4)

## Calculate fuzzy indiscernibility relation
control.9 <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                    type.relation = c("tolerance", "eq.1"))
IND.9 <- BC.IND.relation.FRST(decision.table, attributes = attributes, control = control.9)




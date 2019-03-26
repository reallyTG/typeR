library(RoughSets)


### Name: RoughSets-package
### Title: Getting started with the RoughSets package
### Aliases: RoughSets RoughSets-package

### ** Examples

##############################################################
## A.1 Example: Basic concepts of rough set theory
##############################################################
## Using hiring data set, see RoughSetData
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## define considered attributes which are first, second, and
## third attributes
attr.P <- c(1,2,3)

## compute indiscernibility relation
IND <- BC.IND.relation.RST(decision.table, feature.set = attr.P)

## compute lower and upper approximations
roughset <- BC.LU.approximation.RST(decision.table, IND)

## Determine regions
region.RST <- BC.positive.reg.RST(decision.table, roughset)

## The decision-relative discernibility matrix and reduct
disc.mat <- BC.discernibility.mat.RST(decision.table, range.object = NULL)

##############################################################
## A.2 Example: Basic concepts of fuzzy rough set theory
##############################################################
## Using pima7 data set, see RoughSetData
data(RoughSetData)
decision.table <- RoughSetData$pima7.dt

## In this case, let us consider the first and second attributes
conditional.attr <- c(1, 2)

## We are using the "lukasiewicz" t-norm and the "tolerance" relation
## with "eq.1" as fuzzy similarity equation
control.ind <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
                    type.relation = c("tolerance", "eq.1"))

## Compute fuzzy indiscernibility relation
IND.condAttr <- BC.IND.relation.FRST(decision.table, attributes = conditional.attr,
                            control = control.ind)

## Compute fuzzy lower and upper approximation using type.LU : "implicator.tnorm"
## Define index of decision attribute
decision.attr = c(9)

## Compute fuzzy indiscernibility relation of decision attribute
## We are using "crisp" for type of aggregation and type of relation
control.dec <- list(type.aggregation = c("crisp"), type.relation = "crisp")

IND.decAttr <- BC.IND.relation.FRST(decision.table, attributes = decision.attr,
                            control = control.dec)

## Define control parameter containing type of implicator and t-norm
control <- list(t.implicator = "lukasiewicz", t.tnorm = "lukasiewicz")

## Compute fuzzy lower and upper approximation
FRST.LU <- BC.LU.approximation.FRST(decision.table, IND.condAttr, IND.decAttr,
              type.LU = "implicator.tnorm", control = control)

## Determine fuzzy positive region and its degree of dependency
fuzzy.region <- BC.positive.reg.FRST(decision.table, FRST.LU)

###############################################################
## B Example : Data analysis based on RST and FRST
## In this example, we are using wine dataset for both RST and FRST
###############################################################
## Load the data
## Not run: 
##D data(RoughSetData)
##D dataset <- RoughSetData$wine.dt
##D 
##D ## Shuffle the data with set.seed
##D set.seed(5)
##D dt.Shuffled <- dataset[sample(nrow(dataset)),]
##D 
##D ## Split the data into training and testing
##D idx <- round(0.8 * nrow(dt.Shuffled))
##D   wine.tra <-SF.asDecisionTable(dt.Shuffled[1:idx,],
##D decision.attr = 14, indx.nominal = 14)
##D   wine.tst <- SF.asDecisionTable(dt.Shuffled[
##D  (idx+1):nrow(dt.Shuffled), -ncol(dt.Shuffled)])
##D 
##D ## DISCRETIZATION
##D cut.values <- D.discretization.RST(wine.tra,
##D type.method = "global.discernibility")
##D d.tra <- SF.applyDecTable(wine.tra, cut.values)
##D d.tst <- SF.applyDecTable(wine.tst, cut.values)
##D 
##D ## FEATURE SELECTION
##D red.rst <- FS.feature.subset.computation(d.tra,
##D   method="quickreduct.rst")
##D fs.tra <- SF.applyDecTable(d.tra, red.rst)
##D 
##D ## RULE INDUCTION
##D rules <- RI.indiscernibilityBasedRules.RST(d.tra,
##D   red.rst)
##D 
##D ## predicting newdata
##D pred.vals <- predict(rules, d.tst)
##D 
##D #################################################
##D ## Examples: Data analysis using the wine dataset
##D ## 2. Learning and prediction using FRST
##D #################################################
##D 
##D ## FEATURE SELECTION
##D reduct <- FS.feature.subset.computation(wine.tra,
##D  method = "quickreduct.frst")
##D 
##D ## generate new decision tables
##D wine.tra.fs <- SF.applyDecTable(wine.tra, reduct)
##D wine.tst.fs <- SF.applyDecTable(wine.tst, reduct)
##D 
##D ## INSTANCE SELECTION
##D indx <- IS.FRIS.FRST(wine.tra.fs,
##D  control = list(threshold.tau = 0.2, alpha = 1))
##D 
##D ## generate a new decision table
##D wine.tra.is <- SF.applyDecTable(wine.tra.fs, indx)
##D 
##D ## RULE INDUCTION (Rule-based classifiers)
##D control.ri <- list(
##D  type.aggregation = c("t.tnorm", "lukasiewicz"),
##D  type.relation = c("tolerance", "eq.3"),
##D  t.implicator = "kleene_dienes")
##D 
##D decRules.hybrid <- RI.hybridFS.FRST(wine.tra.is,
##D   control.ri)
##D 
##D ## predicting newdata
##D predValues.hybrid <- predict(decRules.hybrid,
##D   wine.tst.fs)
##D 
##D #################################################
##D ## Examples: Data analysis using the wine dataset
##D ## 3. Prediction using fuzzy nearest neighbor classifiers
##D #################################################
##D 
##D ## using FRNN.O
##D control.frnn.o <- list(m = 2,
##D   type.membership = "gradual")
##D 
##D predValues.frnn.o <- C.FRNN.O.FRST(wine.tra.is,
##D   newdata = wine.tst.fs, control = control.frnn.o)
##D 
##D ## Using FRNN
##D control.frnn <- list(type.LU = "implicator.tnorm",k=20,
##D   type.aggregation = c("t.tnorm", "lukasiewicz"),
##D   type.relation = c("tolerance", "eq.1"),
##D   t.implicator = "lukasiewicz")
##D 
##D predValues.frnn <- C.FRNN.FRST(wine.tra.is,
##D   newdata = wine.tst.fs, control = control.frnn)
##D 
##D ## calculating error
##D real.val <- dt.Shuffled[(idx+1):nrow(dt.Shuffled),
##D   ncol(dt.Shuffled), drop = FALSE]
##D 
##D err.1 <- 100*sum(pred.vals!=real.val)/nrow(pred.vals)
##D err.2 <- 100*sum(predValues.hybrid!=real.val)/
##D   nrow(predValues.hybrid)
##D err.3 <- 100*sum(predValues.frnn.o!=real.val)/
##D   nrow(predValues.frnn.o)
##D err.4 <- 100*sum(predValues.frnn!=real.val)/
##D   nrow(predValues.frnn)
##D 
##D cat("The percentage error = ", err.1, "\n")
##D cat("The percentage error = ", err.2, "\n")
##D cat("The percentage error = ", err.3, "\n")
##D cat("The percentage error = ", err.4, "\n")
## End(Not run)




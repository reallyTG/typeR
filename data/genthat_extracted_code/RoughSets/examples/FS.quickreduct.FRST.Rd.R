library(RoughSets)


### Name: FS.quickreduct.FRST
### Title: The fuzzy QuickReduct algorithm based on FRST
### Aliases: FS.quickreduct.FRST

### ** Examples

##########################################################
## Example 1: Dataset containing nominal values on all attributes
##########################################################

data(RoughSetData)
decision.table <- RoughSetData$housing7.dt

########## using fuzzy lower approximation ##############
control <- list(t.implicator = "lukasiewicz", type.relation = c("tolerance", "eq.1"),
               type.aggregation = c("t.tnorm", "lukasiewicz"))
reduct.1 <- FS.quickreduct.FRST(decision.table, type.method = "fuzzy.dependency",
                            type.QR = "fuzzy.QR", control = control)

########## using fuzzy boundary region ##############
## Not run: 
##D control <- list(t.implicator = "lukasiewicz", type.relation = c("tolerance", "eq.1"),
##D                 type.aggregation = c("t.tnorm", "lukasiewicz"))
##D reduct.2 <- FS.quickreduct.FRST(decision.table, type.method = "fuzzy.boundary.reg",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## using vaguely quantified rough sets (VQRS) #########
##D control <- list(alpha = 0.9, q.some = c(0.1, 0.6), q.most = c(0.2, 1),
##D                 type.aggregation = c("t.tnorm", "lukasiewicz"))
##D reduct.3 <- FS.quickreduct.FRST(decision.table, type.method = "vqrs",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## ordered weighted average (OWA) #########
##D control <- list(t.implicator = "lukasiewicz", type.relation = c("tolerance", "eq.1"),
##D                 m.owa = 3, type.aggregation = c("t.tnorm","lukasiewicz"))
##D reduct.4 <- FS.quickreduct.FRST(decision.table, type.method = "owa",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## robust fuzzy rough sets (RFRS) #########
##D control <- list(t.implicator = "lukasiewicz", type.relation = c("tolerance", "eq.1"),
##D                type.rfrs = "k.trimmed.min", type.aggregation = c("t.tnorm", "lukasiewicz"),
##D                k.rfrs = 0)
##D reduct.5 <- FS.quickreduct.FRST(decision.table, type.method = "rfrs",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## using min positive region (delta) ###########
##D control <- list(alpha = 1, t.implicator = "lukasiewicz",
##D                 type.relation = c("tolerance", "eq.1"), type.aggregation =
##D                                 c("t.tnorm", "lukasiewicz"))
##D reduct.6 <- FS.quickreduct.FRST(decision.table, type.method = "min.positive.reg",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## using FVPRS approximation ##############
##D control <- list(alpha.precision = 0.05, t.implicator = "lukasiewicz",
##D                type.aggregation = c("t.tnorm", "lukasiewicz"),
##D                type.relation = c("tolerance", "eq.1"))
##D reduct.7 <- FS.quickreduct.FRST(decision.table, type.method = "fvprs",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## using beta.PFRS approximation ##############
##D control <- list(t.implicator = "lukasiewicz", type.relation = c("tolerance", "eq.1"),
##D                 beta.quasi = 0.05, type.aggregation = c("t.tnorm", "lukasiewicz"))
##D reduct.8 <- FS.quickreduct.FRST(decision.table, type.method = "beta.pfrs",
##D                             type.QR = "fuzzy.QR", control = control)
##D 
##D ########## using fuzzy discernibility matrix ##############
##D control <- list(alpha = 1, type.relation = c("tolerance", "eq.1"),
##D                type.aggregation = c("t.tnorm", "lukasiewicz"),
##D                 t.implicator = "lukasiewicz")
##D reduct.9 <- FS.quickreduct.FRST(decision.table, type.method = "fuzzy.discernibility",
##D                             type.QR = "fuzzy.QR", control = control)
## End(Not run)

##########################################################
## Example 2: Dataset containing nominal and continuous values
## In this case, we only provide one method but others work in
## the same way.
## In this example, we will show how to get the
## new decision table as well
##########################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

########## using fuzzy lower approximation ##############
control <- list(type.aggregation = c("t.tnorm", "lukasiewicz"),
               t.implicator = "lukasiewicz", type.relation = c("tolerance", "eq.1"))
reduct.1 <- FS.quickreduct.FRST(decision.table, type.method = "fuzzy.dependency",
                            type.QR = "fuzzy.QR", control = control)

## get new decision table based on reduct
new.decTable <- SF.applyDecTable(decision.table, reduct.1)




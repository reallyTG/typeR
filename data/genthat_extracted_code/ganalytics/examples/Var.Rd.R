library(ganalytics)


### Name: Var
### Title: Google Analytics dimension and metric variables.
### Aliases: Var Var<- GaVar GaVar<- McfVar McfVar<- RtVar RtVar<-
###   Var,character-method Var<-,.var,character-method Var,.expr-method
###   Var<-,.expr,character-method Var,.gaVarList-method
###   GaVar,character-method GaVar<-,.gaVar,character-method
###   GaVar,.expr-method GaVar<-,.expr,character-method
###   GaVar,.gaVarList-method McfVar,ANY-method RtVar,ANY-method

### ** Examples

Var("source")
dim <- Var("ga:medium")
Var(dim)
paid_traffic <- Expr(dim, "==", "cpc")
Var(paid_traffic)

expr1 <- Expr("pageviews", '>', 10)
Var(expr1) <- "uniquePageviews"





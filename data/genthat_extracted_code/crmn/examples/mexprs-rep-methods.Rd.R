library(crmn)


### Name: mexprs-rep-methods
### Title: Accessor
### Aliases: mexprs-rep-methods mexprs<-
###   mexprs<-,ExpressionSet,matrix-method mexprs<-,matrix,matrix-method

### ** Examples

data(mix)
test <- mix
mexprs(test) <- exprs(mix) * 0
head(mexprs(test))
test <- exprs(mix)
mexprs(test) <- test * 0
head(mexprs(test))




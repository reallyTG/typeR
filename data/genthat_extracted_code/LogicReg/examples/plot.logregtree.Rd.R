library(LogicReg)


### Name: plot.logregtree
### Title: A plot of one Logic Regression tree.
### Aliases: plot.logregtree
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit2)
# 
# myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 0)
# logreg.savefit2 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21],
#                type = 2, select = 2, ntrees = c(1,2), nleaves =c(1,7),
#                anneal.control = myanneal2)
for(i in 1:logreg.savefit2$nmodels) for(j in 1:logreg.savefit2$alltrees[[i]]$ntrees[1]){
   plot.logregtree(logreg.savefit2$alltrees[[i]]$trees[[j]])
   title(main=paste("model",i,"tree",j))
}




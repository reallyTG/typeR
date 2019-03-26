library(PopVar)


### Name: pop.predict
### Title: A genome-wide procedure for predicting genetic variance and
###   correlated response in bi-parental breeding populations
### Aliases: pop.predict

### ** Examples

## Not run: 
##D ## View formatting
##D ## Use View() in RStudio or R GUI with X11 forwarding
##D ## Use head() in R GUI without X11 forwarding
##D View(G.in_ex)
##D View(y.in_ex)
##D View(map.in_ex)
##D View(cross.tab_ex)
##D 
##D ## setwd() - pop.predict writes and reads files to disk
##D ##   so it is recommended to set your working directory
##D 
##D ## nSim and nFold are set to low values in the
##D ## examples for sake of computing time
##D 
##D ## Ex. 1 - Predict a defined set of crosses
##D ## This example uses CV method 1 (see Details of x.val() function)
##D ex1.out <- pop.predict(G.in = G.in_ex, y.in = y.in_ex,
##D    map.in = map.in_ex, crossing.table = cross.tab_ex,
##D    nSim=5, nCV.iter=10)
##D ex1.out$predictions  ## Predicted parameters
##D ex1.out$CVs          ## CV results
##D 
##D ## Ex. 2 - Predict all pairwise crosses between a list of parents
##D ## This example uses CV method 2 (see Details of x.val() function)
##D par.list <- sample(y.in_ex[,1], size = 10, replace = F)
##D ex2.out <- pop.predict(G.in = G.in_ex, y.in = y.in_ex,
##D    map.in = map.in_ex, parents = par.list,
##D    nSim=5, nFold=5, nFold.reps=2)
##D 
##D ## Ex. 3 - Use only rrBLUP and Bayesian lasso (BL) models
##D ex3.out <- pop.predict(G.in = G.in_ex, y.in = y.in_ex,
##D    map.in = map.in_ex, crossing.table = cross.tab_ex,
##D    models = c("rrBLUP", "BL"), nSim=5, nCV.iter=10)
## End(Not run)




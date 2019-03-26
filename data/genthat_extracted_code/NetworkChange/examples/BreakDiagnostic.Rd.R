library(NetworkChange)


### Name: BreakDiagnostic
### Title: Detect a break number using different metrics
### Aliases: BreakDiagnostic

### ** Examples

   ## Not run: 
##D    set.seed(19333)
##D    ## Generate an array (15 by 15 by 20) with a block merging transition
##D    Y <- MakeBlockNetworkChange(n=5, T=20, type ="merge")
##D 
##D    ## Fit 3 models (no break, one break, and two break) for break number detection 
##D    detect <- BreakDiagnostic(Y, R=2, break.upper = 2)
##D    
##D    ## Look at the graph
##D    detect[[1]]; print(detect[[2]])
##D 
## End(Not run)






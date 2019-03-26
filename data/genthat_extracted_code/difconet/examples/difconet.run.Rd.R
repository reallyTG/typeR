library(difconet)


### Name: difconet.run
### Title: RUNS A DIFCONET ANALYSIS
### Aliases: difconet.run difconet

### ** Examples


xdata <- matrix(rnorm(1000), ncol=100)
xpredictor <- sample(c("A","B","C","D"),100,replace=TRUE)
dObj <- difconet.run(xdata, xpredictor, metric = 4, num_perms = 10,              
  comparisons = list(c("A","D"), c("A","B"), c("B","D")),
  perm_mode = "columns")

## Not run: 
##D   #xpredictor contains A, B, C, and D.
##D   #xdata contains the data matrix
##D   dObj <- difconet.run(xdata, xpredictor,
##D   metric = c(1,2,4),
##D   cutoff = 0.6,
##D   blocs = 7000,
##D   num_perms = 10,              
##D   comparisons = list(c("A","D"), c("A","B"), c("B","D")),          
##D   perm_mode = "columns")
## End(Not run)





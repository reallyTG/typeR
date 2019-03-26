library(iBST)


### Name: iBST-package
### Title: Improper Bagging Survival Tree
### Aliases: iBST-package iBST
### Keywords: package documentation tree multivariate survival

### ** Examples

## Not run: 
##D  data(burn)
##D  myarg = list(cp = 0, maxcompete = 0, maxsurrogate = 0, maxdepth = 2)
##D  Y.names = c("T3" ,"D3")
##D  P.names = 'Z2'
##D  T.names = c("Z1", paste("Z", 3:11, sep = ''))
##D  mybag = 40
##D  set.seed(5000)
##D  
##D  ## fit an improper survival tree
##D  burn.tree <- improper_tree(burn, Y.names, P.names, T.names, method = "R2", args.rpart = myarg)
##D  plot(burn.tree)
##D  text(burn.tree, cex = .7, xpd = TRUE)
##D  
##D  ## fit an improper Bagging survival tree with the adjusted Logrank criterion
##D  burn.BagEssai0 <- Bagg_Surv(burn, Y.names, P.names, T.names, method = "LR", args.rpart = myarg, 
##D                            args.parallel = list(numWorkers = 1), Bag = mybag)
##D  
##D  ## fit an improper Bagging survival tree with the pseudo R2 criterion
##D  burn.BagEssai1 <- Bagg_Surv(burn, Y.names, P.names, T.names, method = "R2", args.rpart = myarg, 
##D                            args.parallel = list(numWorkers = 1), Bag = mybag)
##D 
##D  ## Plot the variable importance scores
##D  par(mfrow=c(1,3))
##D barplot(burn.BagEssai1$IIS, main = 'IIS', horiz = TRUE, las = 1,
##D         cex.names = .8, col = 'lightblue')
##D barplot(burn.BagEssai1$DIIS, main = 'DIIS', horiz = TRUE, las = 1,
##D         cex.names = .8, col = 'grey') 
##D barplot(burn.BagEssai1$DEPTH, main = 'MinDepth', horiz = TRUE, las = 1,
##D         cex.names = .8, col = 'purple')
##D 
##D 
##D  ## evaluation of the Bagging predictors 
##D pred0 <- Bagg_pred_Surv(burn, Y.names, P.names, burn.BagEssai0, 
##D                         args.parallel = list(numWorkers = 1), OOB = TRUE) 
##D  
##D  
##D  pred1 <- Bagg_pred_Surv(burn, Y.names, P.names, burn.BagEssai1, 
##D                          args.parallel = list(numWorkers = 1), OOB = TRUE) 
##D   
##D  ## The OOB integrated Brier score using the Breslow estimator
##D  pred1$OOB$IBSBREOOB
##D  
##D  ## The permutation importance score using the Breslow estimator
##D  pred1$OOB$vimpoobpbpbre
##D  
## End(Not run)




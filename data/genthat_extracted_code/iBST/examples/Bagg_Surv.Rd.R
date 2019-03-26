library(iBST)


### Name: Bagg_Surv
### Title: Bagging improper survival trees
### Aliases: Bagg_Surv
### Keywords: documentation tree multivariate survival

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
##D  burn.BagEssai0 <- Bagg_Surv(burn, Y.names, P.names, T.names, method = "LR", args.rpart = myarg, 
##D                            args.parallel = list(numWorkers = 1), Bag = mybag)
##D  
##D  burn.BagEssai1 <- Bagg_Surv(burn, Y.names, P.names, T.names, method = "R2", args.rpart = myarg, 
##D                            args.parallel = list(numWorkers = 1), Bag = mybag)
##D 
## End(Not run)




library(GPLTR)


### Name: GPLTR-package
### Title: Fit a generalized partially linear tree-based regression model
### Aliases: GPLTR-package GPLTR
### Keywords: package

### ** Examples


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## Example on a public dataset: the burn data 
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
## The burn data are also displayed in the KMsurv package
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 ## Not run: 
##D  data(burn)
##D 
##D ## Build the rpart tree with all the variables
##D 
##D  rpart.burn <-  rpart(D2 ~ Z1  + Z2 + Z3 + Z4 + Z5 + Z6 + Z7 + Z8 + Z9 
##D                           + Z10  + Z11, data = burn, method = "class")
##D               
##D  plot(rpart.burn, main = 'rpart tree')
##D  text(rpart.burn, xpd = TRUE, cex = .6, use.n = TRUE)
##D 
##D ## fit the PLTR model after adjusting on gender (Z2) using the proposed method
##D 
##D  args.rpart <- list(minbucket = 10, maxdepth = 4, cp = 0, maxcompete = 0, 
##D                     maxsurrogate = 0)
##D  family <- "binomial"
##D  X.names = "Z2"
##D  Y.name = "D2"
##D  G.names = c('Z1','Z3','Z4','Z5','Z6','Z7','Z8','Z9','Z10','Z11')
##D  
##D pltr.burn <- pltr.glm(burn, Y.name, X.names, G.names, args.rpart = args.rpart,
##D                    family = family, iterMax = 4, iterMin = 3, verbose = FALSE)
##D 
##D ## Prunned back the maximal tree using either the BIC or the AIC criterion
##D 
##D pltr.burn_prun <- best.tree.BIC.AIC(xtree = pltr.burn$tree, burn, Y.name, 
##D                                     X.names, family = family)
##D 
##D ## plot the BIC selected tree
##D 
##D plot(pltr.burn_prun$tree$BIC, main = 'BIC selected tree')
##D text(pltr.burn_prun$tree$BIC, xpd = TRUE, cex = .6, col = 'blue')
##D 
##D ## Summary of the selected tree by a BIC criterion
##D 
##D summary(pltr.burn_prun$tree$BIC)
##D 
##D ## Summary of the final selected pltr model
##D 
##D summary(pltr.burn_prun$fit_glm$BIC)
##D 
##D ## fit the PLTR model after adjusting on gender (Z2) using the parametric 
##D ## bootstrap method
##D 
##D ##  set numWorkers = 1 on a windows plateform
##D 
##D  args.parallel = list(numWorkers = 10)
##D  
##D best_bootstrap <- best.tree.bootstrap(pltr.burn$tree, burn, Y.name, X.names,
##D            G.names, B = 2000, BB = 2000, args.rpart = args.rpart, epsi = 0.008,
##D            iterMax = 6, iterMin = 5, family = family, LEVEL = 0.05, LB = FALSE, 
##D               args.parallel = args.parallel, verbose = FALSE)
##D               
##D  plot(best_bootstrap$selected_model$tree, main = 'original method')
##D  text(best_bootstrap$selected_model$tree, xpd = TRUE)
##D 
##D ## Bagging a set of basic unprunned pltr predictors
##D # ?bagging.pltr
##D 
##D Bag.burn <-  bagging.pltr(burn, Y.name, X.names, G.names, family, 
##D               args.rpart,epsi = 0.01, iterMax = 4, iterMin = 3, 
##D               Bag = 10, verbose = FALSE, doprune = FALSE)
##D 
##D ## The thresshold values used
##D 
##D Bag.burn$CUT
##D 
##D ## The set of PLTR models in the bagging procedure
##D 
##D PLTR_BAG.burn <- Bag.burn$Glm_BAG
##D 
##D ## The set of trees in the bagging procedure
##D 
##D TREE_BAG.burn <- Bag.burn$Tree_BAG
##D 
##D ## Use the bagging procedure to predict new features
##D # ?predict_bagg.pltr
##D 
##D Pred_Bag.burn <- predict_bagg.pltr(Bag.burn, Y.name, newdata = burn, 
##D                  type = "response", thresshold = seq(0, 1, by = 0.1))
##D 
##D ## The confusion matrix for each thresshold value using the majority vote
##D 
##D Pred_Bag.burn$CONF1
##D 
##D ## The prediction error for each thresshold value
##D 
##D  Pred_Bag.burn$PRED_ERROR1
##D  
##D ## Compute the variable importances using the bagging procedure
##D  
##D  Var_Imp_BAG.burn <- VIMPBAG(Bag.burn, burn, Y.name)
##D 
##D ## Importance score using the permutaion method for each thresshold value
##D 
##D Var_Imp_BAG.burn$PIS
##D 
##D ## Shadow plot of three proposed scores 
##D 
##D par(mfrow=c(1,3))
##D barplot(Var_Imp_BAG.burn$PIS$CUT5, main = 'PIS', horiz = TRUE, las = 1,
##D         cex.names = .8, col = 'lightblue')
##D barplot(Var_Imp_BAG.burn$DIS, main = 'DIS', horiz = TRUE, las = 1,
##D         cex.names = .8, col = 'grey') 
##D barplot(Var_Imp_BAG.burn$DDIS, main = 'DDIS', horiz = TRUE, las = 1,
##D         cex.names = .8, col = 'purple')
## End(Not run)




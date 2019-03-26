library(sommer)


### Name: EM
### Title: Expectation Maximization Algorithm
### Aliases: EM

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####

# ###################################################
# ###################################################
# # IMPORT DATA FOR  ESTIMATING 3 VARIANCE COMPONENTS
# ###################################################
# ###################################################
# ## Import phenotypic data on inbred performance
# ## Full data
# data(cornHybrid)
# hybrid2 <- cornHybrid$hybrid # extract cross data
# A <- cornHybrid$K # extract the var-cov K
# ############################################
# ############################################
# ## breeding values with 3 variance components
# ############################################
# ############################################
# y <- hybrid2$Yield
# X1 <- model.matrix(~ Location, data = hybrid2);dim(X1)
# Z1 <- model.matrix(~ GCA1 -1, data = hybrid2);dim(Z1)
# Z2 <- model.matrix(~ GCA2 -1, data = hybrid2);dim(Z2)
# Z3 <- model.matrix(~ SCA -1, data = hybrid2);dim(Z3)
# 
# K1 <- A[levels(hybrid2$GCA1), levels(hybrid2$GCA1)]; dim(K1)     
# ## Realized IBS relationships for set of parents 1
# K2 <- A[levels(hybrid2$GCA2), levels(hybrid2$GCA2)]; dim(K2)     
# ## Realized IBS relationships for set of parents 2
# S <- kronecker(K1, K2) ; dim(S)   
# ## Realized IBS relationships for cross (as the Kronecker product of K1 and K2)
# rownames(S) <- colnames(S) <- levels(hybrid2$SCA)
# 
# ETA <- list(list(Z=Z1, K=K1), list(Z=Z2, K=K2), list(Z=Z3, K=S))
# #ans <- EM(y=y, ZETA=ETA, iters=20)





library(sommer)


### Name: MEMMA
### Title: Multivariate Efficient Mixed Model Association Algorithm
### Aliases: MEMMA

### ** Examples


####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####
# data(CPdata)
# ### look at the data
# head(CPpheno)
# CPgeno[1:5,1:5]
# ## fit a model including additive and dominance effects
# Y <- CPpheno[,c("color","Yield")]
# Za <- diag(dim(Y)[1])
# A <- A.mat(CPgeno) # additive relationship matrix
# ####================####
# #### ADDITIVE MODEL ####
# ####================####
# ETA.A <- list(add=list(Z=Za,K=A))
# #ans.A <- MEMMA(Y=Y, ZETA=ETA.A)
# #ans.A$var.comp




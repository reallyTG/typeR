library(markophylo)


### Name: estimaterates_f
### Title: Estimate substitution rate matrix.
### Aliases: estimaterates_f

### ** Examples

##############
## Not run: 
##D rm(list=ls())
##D set.seed(1) #set seed
##D library(markophylo)
##D tree1 <- ape::rtree(4, br = runif(6, 0.01, 0.3)) #generate a random 4-taxa tree (6 branches) 
##D bf <- c(0.33, 0.33, 0.34) #vector of equal root frequencies
##D gf <- 5000 #number of character patterns to be simulated
##D rootseq <- sample(1:3, gf, replace = TRUE, prob = bf) #simulate the MRCA sequence (1s and 2s).
##D par1 <- 1.5 
##D par2 <- 3   
##D par3 <- 5
##D Q_sim <- matrix(c(NA, 0.6, par2, par1, NA, 0.8, par2, par3, NA), 3, 3) 
##D #generated substitution rate matrix
##D diag(Q_sim) <- -rowSums(Q_sim, na.rm = TRUE)
##D print(Q_sim)
##D #simulate data using the geiger package and Q_sim
##D data_sim <- sapply(1:gf, FUN = function(X) geiger::sim.char(tree1, 
##D Q_sim, model = "discrete", root = rootseq[X])) 
##D simulateddat <- list(data = t(data_sim), Q = Q_sim, tree = tree1)
##D 
##D model1 <- markophylo::estimaterates_f(usertree = simulateddat$tree, 
##D userphyl = simulateddat$data, alphabet = c(1, 2, 3), rootprob = "equal", 
##D modelmat = matrix(c(NA, 0.6, 2, 1, NA, 0.8, 2, 3, NA), 3, 3))
## End(Not run)




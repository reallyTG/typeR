library(RGCCA)


### Name: sgcca
### Title: Variable Selection For Generalized Canonical Correlation
###   Analysis (SGCCA)
### Aliases: sgcca

### ** Examples


#############
# Example 1 #
#############
## Not run: 
##D # Download the dataset's package at http://biodev.cea.fr/sgcca/.
##D # --> gliomaData_0.4.tar.gz
##D 
##D require(gliomaData)
##D data(ge_cgh_locIGR)
##D 
##D A <- ge_cgh_locIGR$multiblocks
##D Loc <- factor(ge_cgh_locIGR$y) ; levels(Loc) <- colnames(ge_cgh_locIGR$multiblocks$y)
##D C <-  matrix(c(0, 0, 1, 0, 0, 1, 1, 1, 0), 3, 3)
##D tau = c(1, 1, 0)
##D 
##D # rgcca algorithm using the dual formulation for X1 and X2 
##D # and the dual formulation for X3
##D A[[3]] = A[[3]][, -3]
##D result.rgcca = rgcca(A, C, tau, ncomp = c(2, 2, 1), scheme = "factorial", verbose = TRUE)
##D # sgcca algorithm
##D result.sgcca = sgcca(A, C, c1 = c(.071,.2, 1), ncomp = c(2, 2, 1), 
##D                      scheme = "centroid", verbose = TRUE)
##D 
##D ############################
##D # plot(y1, y2) for (RGCCA) #
##D ############################
##D layout(t(1:2))
##D plot(result.rgcca$Y[[1]][, 1], result.rgcca$Y[[2]][, 1], col = "white", xlab = "Y1 (GE)", 
##D      ylab = "Y2 (CGH)", main = "Factorial plan of RGCCA")
##D text(result.rgcca$Y[[1]][, 1], result.rgcca$Y[[2]][, 1], Loc, col = as.numeric(Loc), cex = .6)
##D plot(result.rgcca$Y[[1]][, 1], result.rgcca$Y[[1]][, 2], col = "white", xlab = "Y1 (GE)", 
##D      ylab = "Y2 (GE)", main = "Factorial plan of RGCCA")
##D text(result.rgcca$Y[[1]][, 1], result.rgcca$Y[[1]][, 2], Loc, col = as.numeric(Loc), cex = .6)
##D 
##D ############################
##D # plot(y1, y2) for (SGCCA) #
##D ############################
##D layout(t(1:2))
##D plot(result.sgcca$Y[[1]][, 1], result.sgcca$Y[[2]][, 1], col = "white", xlab = "Y1 (GE)", 
##D      ylab = "Y2 (CGH)", main = "Factorial plan of SGCCA")
##D text(result.sgcca$Y[[1]][, 1], result.sgcca$Y[[2]][, 1], Loc, col = as.numeric(Loc), cex = .6)
##D 
##D plot(result.sgcca$Y[[1]][, 1], result.sgcca$Y[[1]][, 2], col = "white", xlab = "Y1 (GE)", 
##D      ylab = "Y2 (GE)", main = "Factorial plan of SGCCA")
##D text(result.sgcca$Y[[1]][, 1], result.sgcca$Y[[1]][, 2], Loc, col = as.numeric(Loc), cex = .6)
##D 
##D # sgcca algorithm with multiple components and different L1 penalties for each components 
##D # (-> c1 is a matrix)
##D init = "random"
##D result.sgcca = sgcca(A, C, c1 = matrix(c(.071,.2, 1, 0.06, 0.15, 1), nrow = 2, byrow = TRUE), 
##D                      ncomp = c(2, 2, 1), scheme = "factorial", scale = TRUE, bias = TRUE, 
##D                      init = init, verbose = TRUE)
##D # number of non zero elements per dimension
##D apply(result.sgcca$a[[1]], 2, function(x) sum(x!=0)) 
##D      #(-> 145 non zero elements for a11 and 107 non zero elements for a12)
##D apply(result.sgcca$a[[2]], 2, function(x) sum(x!=0)) 
##D      #(-> 85 non zero elements for a21 and 52 non zero elements for a22)
##D init = "svd"
##D result.sgcca = sgcca(A, C, c1 = matrix(c(.071,.2, 1, 0.06, 0.15, 1), nrow = 2, byrow = TRUE), 
##D                      ncomp = c(2, 2, 1), scheme = "factorial", scale = TRUE, bias = TRUE, 
##D                      init = init, verbose = TRUE)
## End(Not run)




library(RGCCA)


### Name: rgcca
### Title: Regularized Generalized Canonical Correlation Analysis (RGCCA)
### Aliases: rgcca

### ** Examples

#############
# Example 1 #
#############
data(Russett)
X_agric =as.matrix(Russett[,c("gini","farm","rent")])
X_ind = as.matrix(Russett[,c("gnpr","labo")])
X_polit = as.matrix(Russett[ , c("demostab", "dictator")])
A = list(X_agric, X_ind, X_polit)
#Define the design matrix (output = C) 
C = matrix(c(0, 0, 1, 0, 0, 1, 1, 1, 0), 3, 3)
result.rgcca = rgcca(A, C, tau = c(1, 1, 1), scheme = "factorial", scale = TRUE)
lab = as.vector(apply(Russett[, 9:11], 1, which.max))
plot(result.rgcca$Y[[1]], result.rgcca$Y[[2]], col = "white", 
     xlab = "Y1 (Agric. inequality)", ylab = "Y2 (Industrial Development)")
text(result.rgcca$Y[[1]], result.rgcca$Y[[2]], rownames(Russett), col = lab, cex = .7)

#############
# Example 2 #
#############
data(Russett)
X_agric =as.matrix(Russett[,c("gini","farm","rent")])
X_ind = as.matrix(Russett[,c("gnpr","labo")])
X_polit = as.matrix(Russett[ , c("inst", "ecks", "death", 
                                 "demostab", "dictator")])
A = list(X_agric, X_ind, X_polit, cbind(X_agric, X_ind, X_polit))

#Define the design matrix (output = C) 
C = matrix(c(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0), 4, 4)
result.rgcca = rgcca(A, C, tau = c(1, 1, 1, 0), ncomp = rep(2, 4), 
                     scheme = function(x) x^4, scale = TRUE) # HPCA
lab = as.vector(apply(Russett[, 9:11], 1, which.max))
plot(result.rgcca$Y[[4]][, 1], result.rgcca$Y[[4]][, 2], col = "white", 
     xlab = "Global Component 1", ylab = "Global Component 2")
text(result.rgcca$Y[[4]][, 1], result.rgcca$Y[[4]][, 2], rownames(Russett), 
     col = lab, cex = .7)
 
## Not run: 
##D ######################################
##D # example 3: RGCCA and leave one out #
##D ######################################
##D Ytest = matrix(0, 47, 3)
##D X_agric =as.matrix(Russett[,c("gini","farm","rent")])
##D X_ind = as.matrix(Russett[,c("gnpr","labo")])
##D X_polit = as.matrix(Russett[ , c("demostab", "dictator")])
##D A = list(X_agric, X_ind, X_polit)
##D #Define the design matrix (output = C) 
##D C = matrix(c(0, 0, 1, 0, 0, 1, 1, 1, 0), 3, 3)
##D result.rgcca = rgcca(A, C, tau = rep(1, 3), ncomp = rep(1, 3), 
##D                      scheme = "factorial", verbose = TRUE)
##D                      
##D for (i in 1:nrow(Russett)){
##D  B = lapply(A, function(x) x[-i, ])
##D  B = lapply(B, scale2)
##D  resB = rgcca(B, C, tau = rep(1, 3), scheme = "factorial", scale = FALSE, verbose = FALSE)
##D  #  look for potential conflicting sign among components within the loo loop.
##D  for (k in 1:length(B)){
##D    if (cor(result.rgcca$a[[k]], resB$a[[k]]) >= 0) 
##D      resB$a[[k]] = resB$a[[k]] else resB$a[[k]] = -resB$a[[k]]
##D  }
##D  Btest =lapply(A, function(x) x[i, ])
##D  Btest[[1]]=(Btest[[1]]-attr(B[[1]],"scaled:center")) /
##D                  (attr(B[[1]],"scaled:scale"))/sqrt(NCOL(B[[1]]))
##D  Btest[[2]]=(Btest[[2]]-attr(B[[2]],"scaled:center")) / 
##D                  (attr(B[[2]],"scaled:scale"))/sqrt(NCOL(B[[2]]))
##D  Btest[[3]]=(Btest[[3]]-attr(B[[3]],"scaled:center")) / 
##D                  (attr(B[[3]],"scaled:scale"))/sqrt(NCOL(B[[3]]))
##D  Ytest[i, 1] = Btest[[1]]%*%resB$a[[1]]
##D  Ytest[i, 2] = Btest[[2]]%*%resB$a[[2]]
##D  Ytest[i, 3] = Btest[[3]]%*%resB$a[[3]]
##D }
##D lab = apply(Russett[, 9:11], 1, which.max)
##D plot(result.rgcca$Y[[1]], result.rgcca$Y[[2]], col = "white", 
##D      xlab = "Y1 (Agric. inequality)", ylab = "Y2 (Ind. Development)")
##D text(result.rgcca$Y[[1]], result.rgcca$Y[[2]], rownames(Russett), 
##D      col = lab, cex = .7)
##D text(Ytest[, 1], Ytest[, 2], substr(rownames(Russett), 1, 1), 
##D      col = lab, cex = .7)
## End(Not run)




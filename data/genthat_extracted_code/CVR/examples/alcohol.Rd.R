library(CVR)


### Name: alcohol
### Title: Data sets for the alcohol dependence example
### Aliases: alcohol
### Keywords: datasets

### ** Examples

############## Alcohol dependence example ######################
data(alcohol)
gene <- scale(as.matrix(alcohol$gene))
meth <- scale(as.matrix(alcohol$meth))
disorder <- as.matrix(alcohol$disorder)
alcohol.X <- list(X1 = gene, X2 = meth)
## Not run: 
##D   foldid <- c(rep(1:5, 4), c(3,4,5), rep(1:5, 4), c(1,2,5))
##D   ##  table(foldid, disorder)
##D   ## there maybe warnings due to the glm refitting with small sample size
##D   alcohol.cvr <- CVR(disorder, alcohol.X, rankseq = 2, etaseq = 0.02, 
##D                      family = "b", penalty = "L1", foldid = foldid )
##D   plot(alcohol.cvr)
##D   plot(gene %*% alcohol.cvr$solution$W[[1]][, 1], meth %*% alcohol.cvr$solution$W[[2]][, 1])
##D   cor(gene %*% alcohol.cvr$solution$W[[1]], meth %*% alcohol.cvr$solution$W[[2]])
## End(Not run)





library(CVR)


### Name: mouse
### Title: Data sets for the mouse body weight example
### Aliases: mouse
### Keywords: datasets

### ** Examples

############## Mouse body weight example ######################
data(mouse)
expr <- scale(as.matrix(mouse$expr))
geno <- scale(as.matrix(mouse$geno))
bmi <- as.matrix(mouse$bmi)
mouse.X <- list(X1 = expr, X2 = geno)
## Not run: 
##D  mouse.cvr <- CVR(bmi, mouse.X, rankseq = 2, etaseq = 0.04, family = "g", penalty = "L1")
##D  plot(mouse.cvr)
##D  plot(expr %*% mouse.cvr$solution$W[[1]][, 2], geno %*% mouse.cvr$solution$W[[2]][, 2])
##D  cor(expr %*% mouse.cvr$solution$W[[1]], geno %*% mouse.cvr$solution$W[[2]]) 
##D  
## End(Not run)





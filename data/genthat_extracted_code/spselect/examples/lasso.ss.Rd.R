library(spselect)


### Name: lasso.ss
### Title: Spatial scale lasso
### Aliases: lasso.ss
### Keywords: models

### ** Examples

data(y)
data(X)

names.X <- colnames(X)

ss <- c("ind", "ss1", "ss2")

a.lst <- list(NULL)
a.lst[[1]] <- 1
dim(a.lst[[1]]) <- c(1,1)
dimnames(a.lst[[1]]) <- list(NULL, names.X[1])

a.lst[[2]] <- diag(2)
dimnames(a.lst[[2]]) <- list(NULL, names.X[c(2,3)])

a.lst[[3]] <- diag(2)
dimnames(a.lst[[3]]) <- list(NULL, names.X[c(4,5)])

S.v <- c(1,2,2)
C.v <- rep(0,length(a.lst))

mod_lasso.ss <- lasso.ss(y, X, ss, a.lst, S.v, C.v, c("black", "red", "green"))




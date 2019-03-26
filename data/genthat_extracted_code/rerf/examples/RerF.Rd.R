library(rerf)


### Name: RerF
### Title: RerF forest Generator
### Aliases: RerF

### ** Examples

### Train RerF on numeric data ###
library(rerf)
forest <- RerF(as.matrix(iris[, 1:4]), iris[[5L]], num.cores = 1L)

### Train RerF on one-of-K encoded categorical data ###
df1 <- as.data.frame(Titanic)
nc <- ncol(df1)
df2 <- df1[NULL, -nc]
for (i in which(df1$Freq != 0L)) {
  df2 <- rbind(df2, df1[rep(i, df1$Freq[i]), -nc])
}
n <- nrow(df2) # number of observations
p <- ncol(df2) - 1L # number of features
num.categories <- apply(df2[, 1:p], 2, function(x) length(unique(x)))
p.enc <- sum(num.categories) # number of features after one-of-K encoding
X <- matrix(0, nrow = n, ncol = p.enc) # initialize training data matrix X
cat.map <- vector("list", p)
col.idx <- 0L
# one-of-K encode each categorical feature and store in X
for (j in 1:p) {
  cat.map[[j]] <- (col.idx + 1L):(col.idx + num.categories[j])
  # convert categorical feature to K dummy variables
  X[, cat.map[[j]]] <- dummies::dummy(df2[[j]])
  col.idx <- col.idx + num.categories[j]
}
Y <- df2$Survived

# specifying the cat.map in RerF allows training to
# be aware of which dummy variables correspond
# to the same categorical feature
forest <- RerF(X, Y, num.cores = 1L, cat.map = cat.map)
## Not run: 
##D # takes longer than 5s to run.
##D # adding a continuous feature along with the categorical features
##D # must be prepended to the categorical features.
##D set.seed(1234)
##D xp <- runif(nrow(X))
##D Xp <- cbind(xp, X)
##D cat.map1 <- lapply(cat.map, function(x) x + 1)
##D forestW <- RerF(Xp, Y, num.cores = 1L, cat.map = cat.map1)
## End(Not run)

### Train a random rotation ensemble of CART decision trees (see Blaser and Fryzlewicz 2016)
forest <- RerF(as.matrix(iris[, 1:4]), iris[[5L]],
  num.cores = 1L,
  FUN = RandMatRF, paramList = list(p = 4, d = 2), rotate = TRUE
)




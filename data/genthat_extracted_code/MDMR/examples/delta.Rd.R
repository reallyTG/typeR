library(MDMR)


### Name: delta
### Title: Compute univariate MDMR effect sizes
### Aliases: delta

### ** Examples

data(mdmrdata)
# --- Method 1 --- #
delta(X.mdmr, Y = Y.mdmr, dtype = "euclidean", niter = 1, seed = 12345)

# --- Method 2 --- #
D <- dist(Y.mdmr, method = "euclidean")
G <- gower(D)
q <- ncol(Y.mdmr)
G.list <- vector(mode = "list", length = q)
names(G.list) <- names(Y.mdmr)
for(i in 1:q) {
   Y.shuf <- Y.mdmr
   Y.shuf[,i] <- sample(Y.shuf[,i])
   G.list[[i]] <- gower(dist(Y.shuf, method = "euclidean"))
}
delta(X.mdmr, G = G, G.list = G.list)





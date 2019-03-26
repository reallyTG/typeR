## ---- message = F--------------------------------------------------------
library(MDMR)
data(mdmrdata)
D <- dist(Y.mdmr, method = "manhattan")

## ------------------------------------------------------------------------
mdmr.res <- mdmr(X = X.mdmr, D = D)
summary(mdmr.res)

## ------------------------------------------------------------------------
# --- Directly compute the eigenvalues
G <- gower(D)
lambda <- eigen(G, only.values = T)$values
mdmr.res2 <- mdmr(X = X.mdmr, G = G, lambda = lambda)
summary(mdmr.res2)

# --- Output the eigenvalues of G using the first call to mdmr() and pass them to
# --- subsequent calls
# Generate a hypothetical additional predictor we want to test first
set.seed(102)
x1 <- rnorm(500)
mdmr.tmp <- mdmr(X = x1, D = D, return.lambda = T)
# Pass the eigenvalues output by mdmr(return.lambda = t) to the next call of mdmr()
lambda <- mdmr.tmp$lambda
mdmr.res3 <- mdmr(X = X.mdmr, G = G, lambda = lambda)
summary(mdmr.res3)

## ---- fig.width = 5, fig.height = 5, fig.align = 'center'----------------
plot(X.mdmr[,1], Y.mdmr[,1], 
     main = paste0("Correlation = ", round(cor(X.mdmr[,1], Y.mdmr[,1]), 3)),
     xlab = "x1", ylab = "y1")
cor.test(X.mdmr[,1], Y.mdmr[,1])

## ---- fig.width = 7, fig.height = 7/(16/9)-------------------------------
par(mar = c(5, 5, 4, 2) + 0.1)
delta(X = X.mdmr, Y = Y.mdmr, dtype = "manhattan", plot.res = T,
      niter = 1, seed = 12345)

## ---- fig.width = 7, fig.height = 7/(16/9)-------------------------------
D <- dist(Y.mdmr, method = "manhattan")
G <- gower(D)
q <- ncol(Y.mdmr)
G.list <- lapply(1:q, FUN = function(k) {
  set.seed(k)
  Y.shuf <- Y.mdmr
  Y.shuf[,k] <- sample(Y.shuf[,k])
  gower(dist(Y.shuf, method = "manhattan"))
})
names(G.list) <- colnames(Y.mdmr)
par(mar = c(5, 5, 4, 2) + 0.1)
delta(X = X.mdmr, G = G, G.list = G.list, plot.res = T)


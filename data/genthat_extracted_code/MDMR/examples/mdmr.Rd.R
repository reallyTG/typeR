library(MDMR)


### Name: mdmr
### Title: Conduct MDMR with analytic p-values
### Aliases: mdmr

### ** Examples

# --- The following two approaches yield equivalent results --- #
# Approach 1
data(mdmrdata)
D <- dist(Y.mdmr, method = "euclidean")
res1 <- mdmr(X = X.mdmr, D = D)
summary(res1)

# Approach 2
data(mdmrdata)
D <- dist(Y.mdmr, method = "euclidean")
G <- gower(D)
res2 <- mdmr(X = X.mdmr, G = G)
summary(res2)





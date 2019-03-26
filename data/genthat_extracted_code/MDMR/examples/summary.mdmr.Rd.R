library(MDMR)


### Name: summary.mdmr
### Title: Summarizing MDMR Results
### Aliases: summary.mdmr

### ** Examples

# --- The following two approaches yield equivalent results --- #
# Approach 1
data(mdmrdata)
D <- dist(Y.mdmr, method = "euclidean")
mdmr.res <- mdmr(X = X.mdmr, D = D)
summary(mdmr.res)





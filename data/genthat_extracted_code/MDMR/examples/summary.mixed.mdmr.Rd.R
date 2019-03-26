library(MDMR)


### Name: summary.mixed.mdmr
### Title: Summarizing Mixed MDMR Results
### Aliases: summary.mixed.mdmr

### ** Examples

data("clustmdmrdata")

# Get distance matrix
D <- dist(Y.clust)

# Regular MDMR without the grouping variable
mdmr.res <- mdmr(X = X.clust[,1:2], D = D, perm.p = FALSE)

# Results look significant
summary(mdmr.res)


# Account for grouping variable
mixed.res <- mixed.mdmr(~ x1 + x2 + (x1 + x2 | grp),
                        data = X.clust, D = D)

# Signifance was due to the grouping variable
summary(mixed.res)





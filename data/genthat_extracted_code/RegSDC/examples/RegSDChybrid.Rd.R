library(RegSDC)


### Name: RegSDChybrid
### Title: Regression-based SDC Tools - Generalized microaggregation
### Aliases: RegSDChybrid

### ** Examples

#################################################
# Generate example data for introductory examples
################################################# 
y <- matrix(rnorm(30) + 1:30, 10, 3)
x <- matrix(1:10, 10, 1)  # x <- 1:10 is equivalent

# Same as RegSDCipso(y)
yOut <- RegSDChybrid(y)

# With a single cluster both are same as RegSDCipso(y, x)
yOut <- RegSDChybrid(y, xLocal = x)
yOut <- RegSDChybrid(y, xGlobal = x)

# Define two clusters
clust <- rep(1:2, each = 5)

# MHa and MHb in paper
yMHa <- RegSDChybrid(y, clusters = clust, xLocal = x)
yMHb <- RegSDChybrid(y, clusterPieces = clust, xLocal = x)

# An extended variant of MHb as mentioned in paper paragraph below definition of MHa/MHb
yMHbExt <- RegSDChybrid(y, clusterPieces = clust, xClusterPieces = x)

# Identical means within clusters
aggregate(y, list(clust = clust), mean)
aggregate(yMHa, list(clust = clust), mean)
aggregate(yMHb, list(clust = clust), mean)
aggregate(yMHbExt, list(clust = clust), mean)

# Identical global regression results
summary(lm(y[, 1] ~ x))
summary(lm(yMHa[, 1] ~ x))
summary(lm(yMHb[, 1] ~ x))
summary(lm(yMHbExt[, 1] ~ x))

# MHa: Identical local regression results
summary(lm(y[, 1] ~ x, subset = clust == 1))
summary(lm(yMHa[, 1] ~ x, subset = clust == 1))

# MHb: Different results
summary(lm(yMHb[, 1] ~ x, subset = clust == 1))

# MHbExt: Same estimates and different std. errors
summary(lm(yMHbExt[, 1] ~ x, subset = clust == 1))

###################################################
#  Generate example data for more advanced examples
###################################################
x <- matrix((1:90) * (1 + runif(90)), 30, 3)
x1 <- x[, 1]
x2 <- x[, 2]
x3 <- x[, 3]
y <- matrix(rnorm(90), 30, 3) + x
clust <- paste("c", rep(1:3, each = 10), sep = "")

######## Run main algorithm
z0 <- RegSDChybrid(y, clusters = clust, xLocal = x3, xGlobal = cbind(x1, x2))

# Corresponding models by lm
lmy <- lm(y ~ clust + x1 + x2 + x3:clust)
lm0 <- lm(z0 ~ clust + x1 + x2 + x3:clust)

# Preserved regression coef (x3 within clusters)
coef(lmy) - coef(lm0)

# Preservation of x3 coef locally can also be seen by local regression
coef(lm(y ~ x3, subset = clust == "c2")) - coef(lm(z0 ~ x3, subset = clust == "c2"))

# Covariance matrix preserved
cov(resid(lmy)) - cov(resid(lm0))

# But not preserved within clusters
cov(resid(lmy)[clust == "c2", ]) - cov(resid(lm0)[clust == "c2", ])

######## Modification (a)
za <- RegSDChybrid(y, clusters = clust, xLocal = x3, xGlobal = cbind(x1, x2), alternative = "a")
lma <- lm(za ~ clust + x1 + x2 + x3:clust)

# Now covariance matrices preserved within clusters
cov(resid(lmy)[clust == "c2", ]) - cov(resid(lma)[clust == "c2", ])

# If we estimate coef for x1 and x2 within clusters, 
# they become identical and identical to global estimates
coef(lma)
coef(lm(za ~ clust + x1:clust + x2:clust + x3:clust))

######## Modification (c) with automatic calculation of alpha 
# The result depends on the randomly generated data
# When the result is that alpha=1, modification (b) is equivalent
zc <- RegSDChybrid(y, clusters = clust, xLocal = x3, xGlobal = cbind(x1, x2), alternative = "c")
lmc <- lm(zc ~ clust + x1 + x2 + x3:clust)

# Preserved regression coef as above
coef(lmy) - coef(lmc)

# Again covariance matrices preserved within clusters
cov(resid(lmy)[clust == "c2", ]) - cov(resid(lmc)[clust == "c2", ])

# If we estimate coef for x1 and x2 within clusters, 
# results are different from modification (a) above
coef(lmc)
coef(lm(zc ~ clust + x1:clust + x2:clust + x3:clust))


####################################################
# Make groups of clusters (d) and cluster pieces (e)
####################################################
clustGr <- paste("gr", ceiling(rep(1:3, each = 10)/2 + 0.1), sep = "")
clustP <- c("a", "a", rep("b", 28))

######## Modifications (c), (d) and (e)
zGrP <- RegSDChybrid(y, clusters = clust, clusterPieces = clustP, groupedClusters = clustGr,
                     xLocal = x3, xGroupedClusters = x2, xGlobal = x1, alternative = "c")

# Corresponding models by lm
lmGrP <- lm(zGrP ~ clust:clustP + x1 + x2:clustGr + x3:clust - 1)
lmY <- lm(y ~ clust:clustP + x1 + x2:clustGr + x3:clust - 1)

# Preserved regression coef
coef(lmY) - coef(lmGrP)

# Identical means within cluster pieces
aggregate(y, list(clust = clust, clustP = clustP), mean)
aggregate(zGrP, list(clust = clust, clustP = clustP), mean)

# Covariance matrix preserved
cov(resid(lmY)) - cov(resid(lmGrP))

# Covariance matrices preserved within clusters
cov(resid(lmY)[clust == "c2", ]) - cov(resid(lmGrP)[clust == "c2", ])

# Covariance matrices not preserved within cluster pieces
cov(resid(lmY)[clustP == "a", ]) - cov(resid(lmGrP)[clustP == "a", ])




library(agridat)


### Name: aastveit.barley
### Title: Barley heights and environmental covariates in Norway
### Aliases: aastveit.barley aastveit.barley.covs aastveit.barley.height

### ** Examples


data("aastveit.barley.covs")
data("aastveit.barley.height")

if(require(reshape2) & require(pls)){
  
  # First, PCA of each matrix separately

  Z <- acast(aastveit.barley.height, year ~ gen, value.var="height")
  Z <- sweep(Z, 1, rowMeans(Z))
  Z <- sweep(Z, 2, colMeans(Z)) # Double-centered
  sum(Z^2)*4 # Total SS = 10165
  sv <- svd(Z)$d
  round(100 * sv^2/sum(sv^2),1) # Prop of variance each axis
  # Aastveit Figure 1.  PCA of height
  biplot(prcomp(Z),
         main="aastveit.barley - height", cex=0.5)
  
  U <- aastveit.barley.covs
  rownames(U) <- U$year
  U$year <- NULL
  U <- scale(U) # Standardized covariates
  sv <- svd(U)$d
  round(100 * sv^2/sum(sv^2),1) # Proportion of variance on each axis

  ## Not run: 
##D   # Now, PLS relating the two matrices
##D   m1 <- plsr(Z~U)
##D   loadings(m1)
##D   # Aastveit Fig 2a (genotypes), but rotated differently
##D   biplot(m1, which="y", var.axes=TRUE)
##D   # Fig 2b, 2c (not rotated)
##D   biplot(m1, which="x", var.axes=TRUE)
##D   
## End(Not run)

}

## Not run: 
##D   # Adapted from section 7.4 of Turner & Firth,
##D   # "Generalized nonlinear models in R: An overview of the gnm package"
##D   # who in turn reproduce the analysis of Chadoeuf & Denis (1991),
##D   # "Asymptotic variances for the multiplicative interaction model"
##D 
##D   require(agridat)
##D   require(gnm)
##D   data("aastveit.barley.height")
##D   dath <- aastveit.barley.height
##D   dath$year = factor(dath$year)
##D 
##D   set.seed(1)
##D   m2 <- gnm(height ~ year + gen + Mult(year, gen), data = dath)
##D   # Turner: "To obtain parameterization of equation 1, in which sig_k is the
##D   # singular value for component k, the row and column scores must be constrained
##D   # so that the scores sum to zero and the squared scores sum to one.
##D   # These contrasts can be obtained using getContrasts"
##D   gamma <- getContrasts(m2, pickCoef(m2, "[.]y"),
##D                         ref = "mean", scaleWeights = "unit")
##D   delta <- getContrasts(m2, pickCoef(m2, "[.]g"),
##D                         ref = "mean", scaleWeights = "unit")
##D   # estimate & std err
##D   gamma <- gamma$qvframe
##D   delta <- delta$qvframe
##D   # change sign of estimate
##D   gamma[,1] <- -1 * gamma[,1]
##D   delta[,1] <- -1 * delta[,1]
##D   # conf limits based on asymptotic normality, Chadoeuf table 8, p. 350, 
##D   round(cbind(gamma[,1], gamma[, 1] +
##D                            outer(gamma[, 2], c(-1.96, 1.96))) ,3)  
##D   round(cbind(delta[,1], delta[, 1] +
##D                            outer(delta[, 2], c(-1.96, 1.96))) ,3)
## End(Not run)





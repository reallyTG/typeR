library(nFactors)


### Name: generateStructure
### Title: Generate a Factor Structure Matrix.
### Aliases: generateStructure
### Keywords: multivariate

### ** Examples

# .......................................................
# Example inspired from Zwick and Velicer (1986, table 2, p. 437)
## ...................................................................
 unique=0.2; loadings=0.5
 zwick1 <- generateStructure(var=36, mjc=6, pmjc= 6, loadings=loadings,
                             unique=unique)
 zwick2 <- generateStructure(var=36, mjc=3, pmjc=12, loadings=loadings,
                             unique=unique)
 zwick3 <- generateStructure(var=72, mjc=9, pmjc= 8, loadings=loadings,
                             unique=unique)
 zwick4 <- generateStructure(var=72, mjc=6, pmjc=12, loadings=loadings,
                             unique=unique)
 sat=0.8
## ...................................................................
 zwick5 <- generateStructure(var=36, mjc=6, pmjc= 6, loadings=loadings,
                             unique=unique)
 zwick6 <- generateStructure(var=36, mjc=3, pmjc=12, loadings=loadings,
                             unique=unique)
 zwick7 <- generateStructure(var=72, mjc=9, pmjc= 8, loadings=loadings,
                             unique=unique)
 zwick8 <- generateStructure(var=72, mjc=6, pmjc=12, loadings=loadings,
                             unique=unique)
## ...................................................................

# nsubjects <- c(72, 144, 180, 360)
# require(psych)
# Produce an usual correlation matrix from a congeneric model
 nsubjects <- 72
 mzwick5   <- sim.structure(fx=as.matrix(zwick5), n=nsubjects)
 mzwick5$r

# Factor analysis: recovery of the factor structure
 iterativePrincipalAxis(mzwick5$model, nFactors=6,
                        communalities="ginv")$loadings
 iterativePrincipalAxis(mzwick5$r    , nFactors=6,
                        communalities="ginv")$loadings
 factanal(covmat=mzwick5$model,         factors=6)
 factanal(covmat=mzwick5$r    ,         factors=6)
 
# Number of components to retain
 eigenvalues  <- eigen(mzwick5$r)$values
 aparallel    <- parallel(var      = length(eigenvalues),
                          subject  = nsubjects,
                          rep      = 30,
                          quantile = 0.95,
                          model="components")$eigen$qevpea
 results <- nScree(x         = eigenvalues,
                   aparallel = aparallel)
 results$Components
 plotnScree(results)
 
# Number of factors to retain
 eigenvalues.fa  <- eigen(corFA(mzwick5$r))$values
 aparallel.fa    <- parallel(var      = length(eigenvalues.fa),
                             subject  = nsubjects,
                             rep      = 30,
                             quantile = 0.95,
                             model="factors")$eigen$qevpea
 results.fa <- nScree(x      = eigenvalues.fa,
                   aparallel = aparallel.fa,
                   model     ="factors")
 results.fa$Components
 plotnScree(results.fa)
# ......................................................
 



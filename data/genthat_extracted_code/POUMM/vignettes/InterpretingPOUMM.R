## ----setup, include = FALSE----------------------------------------------
# Make results reproducible
set.seed(1)
knitr::opts_chunk$set(cache = FALSE)
options(digits = 4)

library(ggplot2)
library(data.table)
library(POUMM)

cachedResultsFile <- "UserGuideCache.RData"
# this has to be TRUE, otherwise the vignette cannot be generated, since 
# it does not generate tree and data. 
useCachedResults <- TRUE

## ---- include=FALSE, eval=useCachedResults-------------------------------
N <- 500
g0 <- 0           
alpha <- .5        
theta <- 2        
sigma <- 0.2     
sigmae <- 0.2 

load(cachedResultsFile)

## ---- include=TRUE, eval=TRUE, echo=TRUE---------------------------------
N <- 500
g0 <- 0           
alpha <- .5        
theta <- 2        
sigma <- 0.2     
sigmae <- 0.2 

## ------------------------------------------------------------------------
specPMM <- specifyPMM(z[1:N], tree)
fitPMM <- POUMM(z[1:N], tree, spec = specPMM, doMCMC=FALSE)

## ------------------------------------------------------------------------
lmtest::lrtest(fitPMM, fitPOUMM2)

## ------------------------------------------------------------------------
gBM <- rVNodesGivenTreePOUMM(tree, g0, alpha = 0, theta = 0, sigma = sigma)
zBM <- gBM + e

fitPMM_on_zBM <- POUMM(zBM[1:N], tree, spec = specPMM, doMCMC = FALSE)
fitPOUMM_on_zBM <- POUMM(zBM[1:N], tree, doMCMC = FALSE)

lmtest::lrtest(fitPMM_on_zBM, fitPOUMM_on_zBM)

## ---- message=FALSE, warning=FALSE, eval=TRUE----------------------------
specH2tMean <- specifyPOUMM_ATH2tMeanSeG0(z[1:N], tree, nSamplesMCMC = 4e5)
# Mapping from the sampled parameters to the standard POUMM parameters:
specH2tMean$parMapping
# Prior for the MCMC sampling
specH2tMean$parPriorMCMC
# Bounds for the maximum likelihood search
specH2tMean$parLower
specH2tMean$parUpper

## ----eval=FALSE----------------------------------------------------------
#  fitH2tMean <- POUMM(z[1:N], tree, spec = specH2tMean)

## ---- fig.height=5.4, fig.show="hold", fig.width=7.2, warning=FALSE------
plot(fitH2tMean, stat = c("H2tMean", "H2e", "H2tInf", "sigmae"), 
     doZoomIn = TRUE, doPlot = TRUE)

## ---- warning=FALSE------------------------------------------------------
summary(fitH2tMean)[stat %in% c("H2tMean", "H2e", "H2tInf", "sigmae")]

## ------------------------------------------------------------------------
# Compare global empirical heritability
H2eGlobal <- H2e(z[1:N], sigmae = coef(fitH2tMean)['sigmae'])
# versus recent empirical heritability
H2eRecent <- H2e(z[1:N], tree, sigmae = coef(fitH2tMean)['sigmae'], tFrom = 5)
print(c(H2eGlobal, H2eRecent))


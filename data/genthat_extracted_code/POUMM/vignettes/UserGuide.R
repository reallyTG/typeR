## ----setup, include = FALSE----------------------------------------------
# Make results reproducible
set.seed(1)
knitr::opts_chunk$set(cache = FALSE)
options(digits = 4)

library(POUMM)

cachedResultsFile <- "UserGuideCache.RData"
useCachedResults <- file.exists(cachedResultsFile) && TRUE

## ----install-CRAN-packages, eval=FALSE-----------------------------------
#  install.packages("data.table")
#  install.packages("ggplot2")
#  install.packages("lmtest")
#  install.packages("ape")

## ----load-CRAN-packages, eval=TRUE, echo=TRUE, message=FALSE, warning=FALSE, results="hide"----
library(ggplot2)
library(data.table)
library(lmtest)
library(ape)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  devtools::install_github(repo="venelin/POUMM")

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  install.packages("POUMM")

## ------------------------------------------------------------------------
N <- 500
g0 <- 0           
alpha <- .5        
theta <- 2        
sigma <- 0.2     
sigmae <- 0.2 

## ---- include=FALSE, eval=useCachedResults-------------------------------
load(cachedResultsFile)

## ---- echo=FALSE, fig.height=5, fig.width=7, fig.cap="Dashed black and magenta lines denote the deterministic trend towards the long-term mean $\\theta$, fixing the stochastic parameter $\\sigma=0$."----
tStep <- 0.025
t <- seq(0, 6, by = tStep)

plot(t, rTrajectoryOU(g0, tStep, alpha, theta, sigma, length(t)), type = 'l', ylab = expression(bar(z)), ylim = c(0, 4))
#plot(t, rTrajectoryOU(g0, tStep, alpha, theta, sigma, length(t)), type = 'l', main = "Random OU trajectories", ylab = "g", ylim = c(0, 4))
lines(t, rTrajectoryOU(g0, tStep, alpha, theta, 0, length(t)), lty = 2)

lines(t, rTrajectoryOU(g0, tStep, alpha*2, theta, sigma, length(t)), col = "magenta")
lines(t, rTrajectoryOU(g0, tStep, alpha*2, theta, 0, length(t)), lty = 2, col = "magenta")

lines(t, rTrajectoryOU(g0, tStep, alpha, theta, sigma*2, length(t)), col = "blue")

abline(h=theta, lty = 3, col = "darkgrey")

legend("topleft", 
       legend = c(expression(list(alpha == .5, sigma^2 == 0.04)),
                  expression(list(alpha == .5, sigma^2 == 0.16)),
                  expression(list(alpha == .5, sigma^2 == 0)),
                  
                  expression(list(alpha == 1, sigma^2 == 0.04)),
                  expression(list(alpha == 1, sigma^2 == 0)),
                  
                  expression(theta == 2)),
       # legend = c(expression(list(alpha == .5, theta == 2, sigma == 0.2)),
       #            expression(list(alpha == .5, theta == 2, sigma == 0.4)),
       #            expression(list(alpha == .5, theta == 2, sigma == 0)),
       #            
       #            expression(list(alpha == 1, theta == 2, sigma == 0.2)),
       #            expression(list(alpha == 1, theta == 2, sigma == 0)),
       #            
       #            expression(theta == 2)),
       lty = c(1, 1, 2, 1, 2, 3), 
       col = c("black", "blue", "black", "magenta", "magenta", "darkgrey"))

## ----simulate-tree, results="hide", eval=!useCachedResults---------------
#  # Number of tips
#  tree <- rtree(N)
#  
#  plot(tree, show.tip.label = FALSE)

## ----simulate-gez-OU, eval=!useCachedResults-----------------------------
#  # genotypic (heritable) values
#  g <- rVNodesGivenTreePOUMM(tree, g0, alpha, theta, sigma)
#  
#  # environmental contributions
#  e <- rnorm(length(g), 0, sigmae)
#  
#  # phenotypic values
#  z <- g + e

## ----violin-plots, fig.show = "hold", fig.height=4, fig.width=7, fig.cap="Distributions of the trait-values grouped according to their root-tip distances."----
# This is easily done using the nodeTimes utility function in combination with
# the cut-function from the base package.
data <- data.table(z = z[1:N], t = nodeTimes(tree, tipsOnly = TRUE))
data <- data[, group := cut(t, breaks = 5, include.lowest = TRUE)]

ggplot(data = data, aes(x = t, y = z, group = group)) + 
  geom_violin(aes(col = group)) + geom_point(aes(col = group), size=.5)

## ----MaintainCache, echo=FALSE, warning=FALSE, results="hide", message=FALSE, eval=TRUE----
if(!useCachedResults) {
  # Perform the heavy fits locally. 
  # set up a parallel cluster on the local computer for parallel MCMC:
  cluster <- parallel::makeCluster(parallel::detectCores(logical = FALSE))
  doParallel::registerDoParallel(cluster)
  
  fitPOUMM <- POUMM(z[1:N], tree, spec=list(thinMCMC = 1000, parallelMCMC=TRUE), verbose = TRUE)
  fitPOUMM2 <- POUMM(z[1:N], tree, spec=list(nSamplesMCMC = 4e5, thinMCMC = 1000, parallelMCMC=TRUE))
  
  specH2tMean <- specifyPOUMM_ATH2tMeanSeG0(z[1:N], tree, 
                                                   nSamplesMCMC = 4e5, 
                                                   thinMCMC = 1000, parallelMCMC=TRUE)
  fitH2tMean <- POUMM(z[1:N], tree, spec = specH2tMean)
  
  
  # Don't forget to destroy the parallel cluster to avoid leaving zombie worker-processes.
  parallel::stopCluster(cluster)

  save(g, z, tree, e, 
       fitPOUMM2, fitPOUMM, fitH2tMean,
       file = cachedResultsFile)
} 

## ----RestorePruneInfo, echo=FALSE, warning=FALSE, results="hide", message=FALSE, eval=TRUE----
# restore the pruneInfo since it is needed afterwards.
fitPOUMM$pruneInfo <- fitPOUMM2$pruneInfo <- fitH2tMean$pruneInfo <- pruneTree(tree, z[1:length(tree$tip.label)])

## ----fitPOUMM-1, results="hide", message=FALSE, warning=FALSE, eval=FALSE----
#  fitPOUMM <- POUMM(z[1:N], tree)

## ---- fig.height=5.4, fig.show="hold", fig.width=7.2, warning=FALSE, fig.cap="MCMC traces from a POUMM MCMC-fit.", results="hide", eval=TRUE----

# get a list of plots 
plotList <- plot(fitPOUMM, showUnivarDensityOnDiag = TRUE, doPlot = FALSE)
plotList$traceplot

## ---- fig.height=5.4, fig.show="hold", fig.width=7.2, warning=FALSE, fig.cap="MCMC univariate density plots. Black dots on the x-axis indicate the ML-fit."----
plotList$densplot

## ---- warning=FALSE, eval=TRUE-------------------------------------------
summary(fitPOUMM)

## ----fitPOUMM-2, results="hide", eval=FALSE------------------------------
#  fitPOUMM2 <- POUMM(z[1:N], tree, spec=list(nSamplesMCMC = 4e5))

## ---- fig.height=5.4, fig.show="hold", fig.width=7.2, warning=FALSE, results="hide", eval=TRUE----
plotList <- plot(fitPOUMM2, doPlot = FALSE)
plotList$densplot

## ---- warning=FALSE, eval=TRUE-------------------------------------------
summary(fitPOUMM2)

## ------------------------------------------------------------------------
tMean <- mean(nodeTimes(tree, tipsOnly = TRUE))
tMax <- max(nodeTimes(tree, tipsOnly = TRUE))

c(# phylogenetic heritability at mean root-tip distance: 
  H2tMean = H2(alpha, sigma, sigmae, t = tMean),
  # phylogenetic heritability at long term equilibirium:
  H2tInf = H2(alpha, sigma, sigmae, t = Inf),
  # empirical (time-independent) phylogenetic heritability, 
  H2e = H2e(z[1:N], sigmae),
  # genotypic variance at mean root-tip distance: 
  sigmaG2tMean = varOU(t = tMean, alpha, sigma),
  # genotypic variance at max root-tip distance: 
  sigmaG2tMean = varOU(t = tMax, alpha, sigma),
  # genotypic variance at long-term equilibrium:
  sigmaG2tInf = varOU(t = Inf, alpha, sigma)
  )

## ---- warning=FALSE------------------------------------------------------
c(H2empirical = var(g[1:N])/var(z[1:N]))
summary(fitPOUMM2)["H2e"==stat, unlist(HPD)]

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  # set up a parallel cluster on the local computer for parallel MCMC:
#  cluster <- parallel::makeCluster(parallel::detectCores(logical = FALSE))
#  doParallel::registerDoParallel(cluster)
#  
#  fitPOUMM <- POUMM(z[1:N], tree, spec=list(parallelMCMC = TRUE))
#  
#  # Don't forget to destroy the parallel cluster to avoid leaving zombie worker-processes.
#  parallel::stopCluster(cluster)

## ----create-references, echo=FALSE, include=FALSE, eval=TRUE-------------
likCalculation <- c("Rcpp", "Rmpfr")
mcmcSampling <- c("adaptMCMC")
mcmcDiagnosis <- c("coda")
otherPackages <- c("parallel", "foreach", "data.table", "Matrix")
treeProcessing <- c("ape")
reporting <- c("data.table", "ggplot2", "lmtest")
testing <- c("testthat", "mvtnorm")
 
packagesUsed <- c(likCalculation, mcmcDiagnosis, otherPackages, treeProcessing, reporting, testing)

printPackages <- function(packs) {
  res <- ""
  for(i in 1:length(packs)) {
    res <- paste0(res, paste0(packs[i], ' v', packageVersion(packs[i]), ' [@R-', packs[i], ']'))
    if(i < length(packs)) {
      res <- paste0(res, ', ')
    }
  }
  res
}

# Write bib information (this line is executed manually and the bib-file is edited manually after that)
# knitr::write_bib(packagesUsed, file = "./REFERENCES-R.bib")


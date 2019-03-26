## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height = 5, fig.align = 'center', fig.show='hold',
                      warning=FALSE, message=FALSE, progress=FALSE, collapse=TRUE, comments="#>")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('devtools')
#  devtools::install_github('Keefe-Murphy/IMIFA')

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('IMIFA')

## ------------------------------------------------------------------------
library(IMIFA)

## ---- eval=FALSE---------------------------------------------------------
#  # Simulate 100 observations from 3 balanced clusters with cluster-specific numbers of latent factors
#  sim_data <- sim_IMIFA_data(N=100, G=3, P=20, Q=c(2, 2, 5),
#                             psi=matrix(rgamma(60, 2, 1), nrow=20, ncol=3),
#                             mu=matrix(rnorm(60, -2 + 1:3, 1), nrow=20, ncol=3, byrow=TRUE))

## ------------------------------------------------------------------------
data(olive)

## ---- eval=FALSE---------------------------------------------------------
#  ?olive

## ---- eval=FALSE---------------------------------------------------------
#  ?mcmc_IMIFA

## ---- eval=FALSE---------------------------------------------------------
#  simMFA   <- mcmc_IMIFA(olive, method="MFA", n.iters=10000, range.G=3:6, range.Q=0:3, centering=FALSE,
#                         scaling="unit", uni.type="isotropic", score.switch=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  simMIFA  <- mcmc_IMIFA(olive, method="MIFA", n.iters=10000, centering=TRUE,
#                         range.G=1:3, z.init="kmeans")

## ---- eval=FALSE---------------------------------------------------------
#  simOMIFA <- mcmc_IMIFA(olive, method="OMIFA", n.iters=10000, range.G=10, alpha=0.8,
#                         alpha.d1=3.5, nu=3, alpha.d2=7, prop=0.6, epsilon=0.12)

## ---- eval=FALSE---------------------------------------------------------
#  simIMIFA <- mcmc_IMIFA(olive, method="IMIFA", n.iters=50000, verbose=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  resMFA  <- get_IMIFA_results(simMFA)

## ---- eval=FALSE---------------------------------------------------------
#  resMFA2 <- get_IMIFA_results(simMFA, G=3, criterion="aic.mcmc")

## ---- eval=FALSE---------------------------------------------------------
#  resIMIFA <- get_IMIFA_results(simIMIFA, z.avgsim=TRUE)

## ---- include=FALSE------------------------------------------------------
load(file="res_olive_IMIFA__Edited-Vignette-only-Version.rda")

## ------------------------------------------------------------------------
summary(resIMIFA)

## ---- results='hide', eval=FALSE-----------------------------------------
#  plot(resIMIFA, plot.meth="GQ")

## ---- results='hide', echo=FALSE-----------------------------------------
plot(resIMIFA, plot.meth="GQ", g=1)

## ---- results='hide', echo=FALSE-----------------------------------------
suppressWarnings(plot(resIMIFA, plot.meth="GQ", g=2))

## ---- results='hide', echo=FALSE-----------------------------------------
plot(resIMIFA, plot.meth="GQ", g=3)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="zlabels", zlabels=olive$area, g=1)

## ---- results="hide"-----------------------------------------------------
plot(resIMIFA, plot.meth="zlabels", zlabels=olive$area, g=2)

## ---- results="hide"-----------------------------------------------------
plot(resIMIFA, plot.meth="zlabels", g=4)

## ---- eval=FALSE---------------------------------------------------------
#  plot(resIMIFA, plot.meth="zlabels", g=5)

## ---- results='hide', echo=FALSE-----------------------------------------
suppressMessages(plot(resIMIFA, plot.meth="zlabels", g=5))

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="means", param="means", mat=TRUE, g=1)

## ---- eval=FALSE---------------------------------------------------------
#  plot(resIMIFA, plot.meth="trace", param="scores", mat=TRUE, ind=1)

## ---- eval=FALSE---------------------------------------------------------
#  plot(resIMIFA, plot.meth="trace", param="scores", mat=TRUE, by.fac=TRUE, fac=2)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="means", param="loadings", heat.map=TRUE, g=1)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="parallel.coords", param="uniquenesses")

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="errors", g=1)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="errors", g=3)

## ---- fig.height=7-------------------------------------------------------
plot(resIMIFA, plot.meth="all", param="alpha")

## ---- fig.height=7-------------------------------------------------------
plot(resIMIFA, plot.meth="all", param="discount")


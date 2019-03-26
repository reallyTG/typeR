library(flexmix)


### Name: FLXMCfactanal
### Title: Driver for Mixtures of Factor Analyzers
### Aliases: FLXMCfactanal rFLXM,FLXMCfactanal,FLXcomponent-method
### Keywords: models

### ** Examples

## Reproduce (partly) Table 8.1. p.255 (McLachlan and Peel, 2000)
if (require("gclus")) {
  data("wine", package = "gclus")
  wine_data <- as.matrix(wine[,-1])
  set.seed(123)
  wine_fl_diag <- initFlexmix(wine_data ~ 1, k = 3, nrep = 10,
                              model = FLXMCmvnorm(diagonal = TRUE))
  wine_fl_fact <- lapply(1:4, function(q) flexmix(wine_data ~ 1, model =
                          FLXMCfactanal(factors = q, nstart = 3),
                          cluster = posterior(wine_fl_diag)))
  sapply(wine_fl_fact, logLik)
  ## FULL
  set.seed(123)
  wine_full <- initFlexmix(wine_data ~ 1, k = 3, nrep = 10,
                           model = FLXMCmvnorm(diagonal = FALSE))
  logLik(wine_full)
  ## TRUE
  wine_true <- flexmix(wine_data ~ 1, cluster = wine$Class,
                       model = FLXMCmvnorm(diagonal = FALSE))
  logLik(wine_true)
}




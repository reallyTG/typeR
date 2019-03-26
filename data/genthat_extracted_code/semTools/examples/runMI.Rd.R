library(semTools)


### Name: runMI
### Title: Fit a lavaan Model to Multiple Imputed Data Sets
### Aliases: runMI lavaan.mi cfa.mi sem.mi growth.mi

### ** Examples

 ## Not run: 
##D ## impose missing data for example
##D HSMiss <- HolzingerSwineford1939[ , c(paste("x", 1:9, sep = ""),
##D                                       "ageyr","agemo","school")]
##D set.seed(12345)
##D HSMiss$x5 <- ifelse(HSMiss$x5 <= quantile(HSMiss$x5, .3), NA, HSMiss$x5)
##D age <- HSMiss$ageyr + HSMiss$agemo/12
##D HSMiss$x9 <- ifelse(age <= quantile(age, .3), NA, HSMiss$x9)
##D 
##D ## specify CFA model from lavaan's ?cfa help page
##D HS.model <- '
##D   visual  =~ x1 + x2 + x3
##D   textual =~ x4 + x5 + x6
##D   speed   =~ x7 + x8 + x9
##D '
##D 
##D ## impute data within runMI...
##D out1 <- cfa.mi(HS.model, data = HSMiss, m = 20, seed = 12345,
##D                miArgs = list(noms = "school"))
##D 
##D ## ... or impute missing data first
##D library(Amelia)
##D set.seed(12345)
##D HS.amelia <- amelia(HSMiss, m = 20, noms = "school", p2s = FALSE)
##D imps <- HS.amelia$imputations
##D out2 <- cfa.mi(HS.model, data = imps)
##D 
##D ## same results (using the same seed results in the same imputations)
##D cbind(impute.within = coef(out1), impute.first = coef(out2))
##D 
##D summary(out1)
##D summary(out1, ci = FALSE, fmi = TRUE, add.attributes = FALSE)
##D summary(out1, ci = FALSE, stand = TRUE, rsq = TRUE)
##D 
##D ## model fit. D3 includes information criteria
##D anova(out1)
##D ## equivalently:
##D lavTestLRT.mi(out1)
##D ## request D2
##D anova(out1, test = "D2")
##D ## request fit indices
##D fitMeasures(out1)
##D 
##D 
##D ## fit multigroup model without invariance constraints
##D mgfit.config <- cfa.mi(HS.model, data = imps, estimator = "mlm",
##D                        group = "school")
##D ## add invariance constraints, and use previous fit as "data"
##D mgfit.metric <- cfa.mi(HS.model, data = mgfit1, estimator = "mlm"
##D                        group = "school", group.equal = "loadings")
##D mgfit.scalar <- cfa.mi(HS.model, data = mgfit1, estimator = "mlm"
##D                        group = "school",
##D                        group.equal = c("loadings","intercepts"))
##D 
##D ## compare fit of 2 models to test metric invariance
##D ## (scaled likelihood ratio test)
##D lavTestLRT.mi(mgfit.metric, h1 = mgfit.config)
##D ## To compare multiple models, you must use anova()
##D anova(mgfit.config, mgfit.metric, mgfit.scalar)
##D ## or compareFit(), which also includes fit indices for comparison
##D ## (optional: name the models)
##D compareFit(config = mgfit.config, metric = mgfit.metric,
##D            scalar = mgfit.scalar,
##D            argsLRT = list(test = "D2", method = "satorra.bentler.2010"))
##D 
##D ## correlation residuals to investigate local misfit
##D resid(mgfit.scalar, type = "cor.bentler")
##D ## modification indices for fixed parameters, to investigate local misfit
##D modindices.mi(mgfit.scalar)
##D ## or lavTestScore.mi for modification indices about equality constraints
##D lavTestScore.mi(mgfit.scalar)
##D 
##D ## Wald test of whether latent means are == (fix 3 means to zero in group 2)
##D eq.means <- ' .p70. == 0
##D               .p71. == 0
##D               .p72. == 0 '
##D lavTestWald.mi(mgfit.scalar, constraints = eq.means)
##D 
##D 
##D 
##D ## ordered-categorical data
##D data(datCat)
##D lapply(datCat, class)
##D ## impose missing values
##D set.seed(123)
##D for (i in 1:8) datCat[sample(1:nrow(datCat), size = .1*nrow(datCat)), i] <- NA
##D 
##D catout <- cfa.mi(' f =~ u1 + u2 + u3 + u4 ', data = datCat,
##D                  m = 3, seed = 456,
##D                  miArgs = list(ords = paste0("u", 1:8), noms = "g"),
##D                  FUN = function(fit) {
##D                    list(wrmr = lavaan::fitMeasures(fit, "wrmr"),
##D                         zeroCells = lavaan::lavInspect(fit, "zero.cell.tables"))
##D                  })
##D summary(catout)
##D fitMeasures(catout, indices = "all") # scaled versions of indices, too
##D 
##D ## extract custom output
##D sapply(catout@funList, function(x) x$wrmr) # WRMR for each imputation
##D catout@funList[[1]]$zeroCells # zero-cell tables for first imputation
##D catout@funList[[2]]$zeroCells # zero-cell tables for second imputation ...
##D 
## End(Not run)





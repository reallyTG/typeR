library(semTools)


### Name: compareFit
### Title: Build an object summarizing fit indices across multiple models
### Aliases: compareFit

### ** Examples


HS.model <- ' visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed =~ x7 + x8 + x9 '

fit1 <- cfa(HS.model, data = HolzingerSwineford1939)

## non-nested model
m2 <- ' f1 =~ x1 + x2 + x3 + x4
        f2 =~ x5 + x6 + x7 + x8 + x9 '
fit2 <- cfa(m2, data = HolzingerSwineford1939)
compareFit(fit1, fit2, nested = FALSE)


## nested model comparisons:
out <- measurementInvariance(model = HS.model, data = HolzingerSwineford1939,
                             group = "school", quiet = TRUE)
compareFit(out)

## Not run: 
##D ## also applies to lavaan.mi objects (fit model to multiple imputations)
##D set.seed(12345)
##D HSMiss <- HolzingerSwineford1939[ , paste("x", 1:9, sep = "")]
##D HSMiss$x5 <- ifelse(HSMiss$x1 <= quantile(HSMiss$x1, .3), NA, HSMiss$x5)
##D HSMiss$x9 <- ifelse(is.na(HSMiss$x5), NA, HSMiss$x9)
##D HSMiss$school <- HolzingerSwineford1939$school
##D HS.amelia <- amelia(HSMiss, m = 20, noms = "school")
##D imps <- HS.amelia$imputations
##D 
##D ## request robust test statistics
##D mgfit2 <- cfa.mi(HS.model, data = imps, group = "school", estimator = "mlm")
##D mgfit1 <- cfa.mi(HS.model, data = imps, group = "school", estimator = "mlm",
##D                  group.equal = "loadings")
##D mgfit0 <- cfa.mi(HS.model, data = imps, group = "school", estimator = "mlm",
##D                  group.equal = c("loadings","intercepts"))
##D 
##D ## request the strictly-positive robust test statistics
##D compareFit(scalar = mgfit0, metric = mgfit1, config = mgfit2,
##D            argsLRT = list(asymptotic = TRUE,
##D                           method = "satorra.bentler.2010"))
## End(Not run)





library(lvnet)


### Name: lav2lvnet
### Title: Convert lavaan model to lvnet model matrices
### Aliases: lav2lvnet

### ** Examples

## Not run: 
##D library("lavaan")
##D 
##D # Load dataset:
##D data(HolzingerSwineford1939)
##D Data <- HolzingerSwineford1939[,7:15]
##D 
##D # lavaan model
##D HS.model <- '
##D visual  =~ x1 + x2 + x3
##D textual =~ x4 + x5 + x6
##D speed   =~ x7 + x8 + x9 '
##D 
##D # fit via lavaan:
##D lavFit <- cfa(HS.model, HolzingerSwineford1939[7:15],std.lv=TRUE)
##D 
##D # Fit via lvnet:
##D mod <- lav2lvnet(HS.model, HolzingerSwineford1939[7:15])
##D lvnetFit <- lvnet(Data, lambda = mod$lambda, psi = mod$psi)
##D 
##D # Compare:
##D Compare <- data.frame(
##D   lvnet = round(unlist(lvnetFit$fitMeasures)[c("npar","df","chisq","fmin","aic","bic",
##D                                               "rmsea","cfi","tli","nfi","logl")],3),
##D   lavaan = round(fitMeasures(lavFit)[c("npar","df","chisq","fmin","aic","bic","rmsea",
##D                                       "cfi","tli","nfi","logl")],3))
##D 
##D Compare
## End(Not run)




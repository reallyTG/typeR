library(spaMM)


### Name: corrHLfit
### Title: Fits a mixed model, typically a spatial GLMM.
### Aliases: corrHLfit
### Keywords: model

### ** Examples

# Example with an adjacency matrix (autoregressive model):
# see 'adjacency' documentation page

#### Examples with Matérn correlations
## A likelihood ratio test based on the ML fits of a full and of a null model.
if (spaMM.getOption("example_maxtime")>1.4) {
 data("blackcap")
 fullfit <- corrHLfit(migStatus ~ means+ Matern(1|latitude+longitude),data=blackcap,
                    HLmethod="ML") 
 summary(fullfit)
 nullfit <- corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude),data=blackcap,
                    HLmethod="ML",init.corrHLfit=list(phi=1e-6)) 
 summary(nullfit)
 ## p-value:
 1-pchisq(2*(logLik(fullfit)-logLik(nullfit)),df=1)
}

## see data set Loaloa for additional examples




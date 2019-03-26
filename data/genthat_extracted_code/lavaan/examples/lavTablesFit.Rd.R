library(lavaan)


### Name: lavTablesFitCp
### Title: Pairwise maximum likelihood fit statistics
### Aliases: lavTablesFitCp lavTablesFitCf lavTablesFitCm
### Keywords: pairwise maximum likelihood, discrete data, goodness of fit

### ** Examples

# Data
HS9 <- HolzingerSwineford1939[,c("x1","x2","x3","x4","x5",
                                 "x6","x7","x8","x9")]
HSbinary <- as.data.frame( lapply(HS9, cut, 2, labels=FALSE) )

# Single group example with one latent factor
HS.model <- ' trait =~ x1 + x2 + x3 + x4 '
fit <- cfa(HS.model, data=HSbinary[,1:4], ordered=names(HSbinary),
           estimator="PML")
lavTablesFitCm(fit)
lavTablesFitCp(fit)
lavTablesFitCf(fit)




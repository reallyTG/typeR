library(blavaan)


### Name: blavFitIndices
### Title: SEM Fit Indices for Bayesian SEM
### Aliases: blavFitIndices blavFitIndices-class show,blavFitIndices-method
###   summary,blavFitIndices-method

### ** Examples
 ## Not run: 
##D HS.model <- ' visual  =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed   =~ x7 + x8 + x9 '
##D ## fit target model
##D fit1 <- bcfa(HS.model, data = HolzingerSwineford1939, cp = "fa",
##D              n.chains = 2, burnin = 1000, sample = 1000)
##D 
##D ## fit null model to calculate CFI, TLI, and NFI 
##D null.model <- c(paste0("x", 1:9, " ~~ x", 1:9), paste0("x", 1:9, " ~ 1"))
##D fit0 <- bcfa(null.model, data = HolzingerSwineford1939, cp = "fa",
##D              n.chains = 2, burnin = 1000, sample = 1000)
##D 
##D ## calculate posterior distributions of fit indices
##D 
##D ## The default method mimics fit indices derived from ML estimation
##D ML <- blavFitIndices(fit1, baseline.model = fit0)
##D ML
##D summary(ML)
##D 
##D ## other options:
##D 
##D ## - use Hoofs et al.'s (2017) PPMC-based method
##D ## - use the estimated number of parameters from WAIC instead of LOO-IC
##D PPMC <- blavFitIndices(fit1, baseline.model = fit0,
##D                        pD = "waic", rescale = "PPMC")
##D ## issues a warning about using rescale="PPMC" with N < 1000 (see Hoofs et al.)
##D 
##D ## - specify only the desired measures of central tendency
##D ## - specify a different "confidence" level for the credible intervals
##D summary(PPMC, central.tendency = c("mean","mode"), prob = .95)
##D 
##D 
##D 
##D ## Access the posterior distributions for further investigation
##D head(distML <- data.frame(ML@indices))
##D 
##D ## For example, diagnostic plots using the bayesplot package:
##D 
##D ## distinguish chains
##D nChains <- blavInspect(fit1, "n.chains")
##D distML$Chain <- rep(1:nChains, each = nrow(distML) / nChains)
##D 
##D library(bayesplot)
##D mcmc_pairs(distML, pars = c("BRMSEA","BMc","BGammaHat","BCFI","BTLI"),
##D            diag_fun = "hist")
##D ## Indices are highly correlated across iterations in both chains
##D 
##D ## Compare to PPMC method
##D distPPMC <- data.frame(PPMC@indices)
##D distPPMC$Chain <- rep(1:nChains, each = nrow(distPPMC) / nChains)
##D mcmc_pairs(distPPMC, pars = c("BRMSEA","BMc","BGammaHat","BCFI","BTLI"),
##D            diag_fun = "dens")
##D ## nonlinear relation between BRMSEA, related to the floor effect of BRMSEA
##D ## that Hoofs et al. found for larger (12-indicator) models
##D 
## End(Not run)



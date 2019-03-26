library(GDINA)


### Name: modelcomp
### Title: Item-level model comparison using Wald, LR or LM tests
### Aliases: modelcomp extract.modelcomp summary.modelcomp

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D # --- GDINA model ---#
##D fit <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D fit
##D 
##D ###################
##D #
##D # Wald test
##D #
##D ###################
##D 
##D w <- modelcomp(fit)
##D w
##D # wald statistics
##D extract(w,"stats")
##D #p values
##D extract(w,"pvalues")
##D # selected models
##D extract(w,"selected.model")
##D ##########################
##D #
##D # LR and Two-step LR test
##D #
##D ##########################
##D 
##D lr <- modelcomp(fit,method = "LR")
##D lr
##D TwostepLR <- modelcomp(fit,items =c(6:10),method = "LR",LR.args = list(LR.approx = TRUE))
##D TwostepLR
##D 
##D ##########################
##D #
##D # LM test
##D #
##D ##########################
##D 
##D dina <- GDINA(dat = dat, Q = Q, model = "DINA")
##D dino <- GDINA(dat = dat, Q = Q, model = "DINO")
##D acdm <- GDINA(dat = dat, Q = Q, model = "ACDM")
##D lm <- modelcomp(method = "LM",LM.args=list(reducedMDINA = dina,
##D reducedMDINO = dino, reducedMACDM  = acdm))
##D lm
##D 
##D 
## End(Not run)




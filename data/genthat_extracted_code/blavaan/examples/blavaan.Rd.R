library(blavaan)


### Name: blavaan
### Title: Fit a Bayesian Latent Variable Model
### Aliases: blavaan blavaan-class

### ** Examples

## Not run: 
##D # The Holzinger and Swineford (1939) example
##D HS.model <- ' visual  =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed   =~ x7 + x8 + x9 '
##D 
##D fit <- blavaan(HS.model, data=HolzingerSwineford1939,
##D                auto.var=TRUE, auto.fix.first=TRUE,
##D                auto.cov.lv.x=TRUE,
##D                bcontrol=list(method="rjparallel"))
##D summary(fit)
##D coef(fit)
## End(Not run)




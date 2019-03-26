library(blavaan)


### Name: bcfa
### Title: Fit Confirmatory Factor Analysis Models
### Aliases: bcfa

### ** Examples

## Not run: 
##D # The Holzinger and Swineford (1939) example
##D HS.model <- ' visual  =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed   =~ x7 + x8 + x9 '
##D 
##D fit <- bcfa(HS.model, data=HolzingerSwineford1939,
##D             bcontrol=list(method="rjparallel"))
##D summary(fit)
## End(Not run)




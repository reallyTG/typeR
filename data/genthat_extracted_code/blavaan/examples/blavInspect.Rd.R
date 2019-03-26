library(blavaan)


### Name: blavInspect
### Title: Inspect or Extract Information from a fitted blavaan object
### Aliases: blavInspect blavTech

### ** Examples

## Not run: 
##D # The Holzinger and Swineford (1939) example
##D HS.model <- ' visual  =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed   =~ x7 + x8 + x9 '
##D 
##D fit <- bcfa(HS.model, data=HolzingerSwineford1939,
##D             jagcontrol=list(method="rjparallel"))
##D 
##D # extract information
##D blavInspect(fit, "psrf")
##D blavInspect(fit, "hpd", level=.9)
## End(Not run)




library(sppmix)


### Name: Get_Rdiag
### Title: Checking convergence: diagnostics
### Aliases: Get_Rdiag

### ** Examples

## No test: 
truemix_surf <- rmixsurf(m = 3, lambda=100, xlim = c(-3,3), ylim = c(-3,3))
plot(truemix_surf)
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
Get_Rdiag(pp = genPPP, m = 3)
## End(No test)





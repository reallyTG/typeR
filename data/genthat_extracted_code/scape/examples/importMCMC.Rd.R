library(scape)


### Name: importMCMC
### Title: Import Coleraine MCMC Results
### Aliases: importMCMC

### ** Examples

path <- system.file("example/mcmc", package="scape")
mcmc <- importMCMC(path)  # or rename and select particular elements:
mcmc <- importMCMC(path, pretty.labels=TRUE,
                   l.choose=c("CAc","CAs","Survey","Prior","Total"),
                   p.choose=c("R0","Rinit","uinit","cSleft","cSfull",
                              "sSleft","sSfull","logq"))




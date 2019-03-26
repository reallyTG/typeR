library(nlstools)


### Name: michaelismodels
### Title: Michaelis-Menten model and derived equations to model
###   competitive and non-competitive inhibition
### Aliases: michaelismodels michaelis compet_mich non_compet_mich
### Keywords: models

### ** Examples


# Example 1

data(vmkm)
nls1 <- nls(michaelis,vmkm,list(Km=1,Vmax=1))
plotfit(nls1, smooth = TRUE)

# Example 2

data(vmkmki)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))

nls2_c <- nls(compet_mich, vmkmki, list(Km=1,Vmax=20,Ki=0.5))
plotfit(nls2_c, variable=1)
overview(nls2_c)
res2_c <- nlsResiduals(nls2_c)
plot(res2_c, which=1)

nls2_nc <- nls(non_compet_mich, vmkmki, list(Km=1, Vmax=20, Ki=0.5))
plotfit(nls2_nc, variable=1)
overview(nls2_nc)
res2_nc <- nlsResiduals(nls2_nc)
plot(res2_nc, which=1)

par(def.par)

 



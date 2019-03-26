## ---- eval=FALSE---------------------------------------------------------
#  library( devtools )
#  ## At the moment you need to point to the development branch on github.
#  install_github(repo = "thej022214/hisse", ref = "master")

## ---- eval=TRUE----------------------------------------------------------
suppressWarnings(library(hisse))
suppressWarnings(library(diversitree))

## ---- eval=TRUE----------------------------------------------------------
## Generate a list with the parameters of the model:
pars <- SimulateGeoHiSSE(hidden.areas = 1, return.GeoHiSSE_pars = TRUE)
pars

## ---- eval=TRUE----------------------------------------------------------
pars$model.pars[,1] <- c(0.1, 0.1, 0.1, 0.03, 0.03, 0.05, 0.05)
pars$model.pars[,2] <- c(0.2, 0.2, 0.2, 0.03, 0.03, 0.05, 0.05)
pars$q.01[1,2] <- pars$q.01[2,1] <- 0.05
pars$q.0[1,2] <- pars$q.0[2,1] <- 0.05
pars$q.1[1,2] <- pars$q.1[2,1] <- 0.05
pars

## ---- eval=TRUE----------------------------------------------------------
set.seed(1234)
sim.geohisse <- SimulateGeoHiSSE(pars=pars, hidden.areas = 1, x0 = "0A", max.taxa = 200)

## ---- eval=FALSE---------------------------------------------------------
#  ## Model 1 - Dispersal parameters vary only, no range-dependent diversification.
#  speciation <- c(1,1,1)
#  extirpation <- c(1,1)
#  trans.rate <- TransMatMakerGeoHiSSE(hidden.areas=0)
#  mod1 <- GeoHiSSE(phy = sim.geohisse$phy, data = sim.geohisse$data, f=c(1,1,1),
#                    speciation=speciation, extirpation=extirpation,
#                    hidden.areas=FALSE, trans.rate=trans.rate)
#  
#  ## Model 2. Canonical GeoSSE model, range effect on diversification
#  speciation <- c(1,2,3)
#  extirpation <- c(1,2)
#  trans.rate <- TransMatMakerGeoHiSSE(hidden.areas=0)
#  mod2 <- GeoHiSSE(sim.geohisse$phy, data = sim.geohisse$data, f=c(1,1,1),
#                    speciation=speciation, extirpation=extirpation,
#                    hidden.areas=FALSE, trans.rate=trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  ## Model 3. GeoHiSSE model with 1 hidden area, no range-dependent diversification.
#  ## Note below how parameters vary among hidden classes but are the same within each
#  ##      hidden class.
#  speciation <- c(1,1,1,2,2,2)
#  extirpation <- c(1,1,2,2)
#  trans.rate <- TransMatMakerGeoHiSSE(hidden.areas=1)
#  mod3 <- GeoHiSSE(sim.geohisse$phy, data = sim.geohisse$data, f=c(1,1,1),
#                    speciation=speciation, extirpation=extirpation,
#                    hidden.areas=TRUE, trans.rate=trans.rate)
#  
#  ## Model 4. GeoHiSSE model with 1 hidden area, no range-dependent diversification.
#  speciation <- c(1,2,3,4,5,6)
#  extirpation <- c(1,2,3,4)
#  trans.rate <- TransMatMakerGeoHiSSE(hidden.areas=1)
#  mod4 <- GeoHiSSE(sim.geohisse$phy, data = sim.geohisse$data, f=c(1,1,1),
#                    speciation=speciation, extirpation=extirpation,
#                    hidden.areas=TRUE, trans.rate=trans.rate)

## ---- eval=TRUE----------------------------------------------------------
load( "geohisse_vignette.Rsave" )

## ---- eval=TRUE----------------------------------------------------------
mod1

## ---- r, eval=TRUE-------------------------------------------------------
mod2

## ---- eval=TRUE----------------------------------------------------------
mod3

## ---- eval=TRUE----------------------------------------------------------
mod4

## ---- eval=TRUE----------------------------------------------------------
GetModelWeight(model1 = mod1, model2 = mod2, model3 = mod3, model4 = mod4)
## As the number of models in the set grows, naming each model in the set can become hard.
## So one can use a list (created by some automated code) as an imput also:
list.geohisse <- list(model1 = mod1, model2 = mod2, model3 = mod3, model4 = mod4)
GetModelWeight(list.geohisse)

## ---- eval=FALSE---------------------------------------------------------
#  recon.mod1 <- MarginReconGeoSSE(phy = mod1$phy, data = mod1$data, f = mod1$f,
#                                   pars = mod1$solution, hidden.areas = mod1$hidden.areas,
#                                   root.type = mod1$root.type, root.p = mod1$root.p,
#                                   aic = mod1$AIC, n.cores = 4)
#  recon.mod2 <- MarginReconGeoSSE(phy = mod2$phy, data = mod2$data, f = mod2$f,
#                                   pars = mod2$solution, hidden.areas = mod2$hidden.areas,
#                                   root.type = mod2$root.type, root.p = mod2$root.p,
#                                   aic = mod2$AIC, n.cores = 4)
#  recon.mod3 <- MarginReconGeoSSE(phy = mod3$phy, data = mod3$data, f = mod3$f,
#                                   pars = mod3$solution, hidden.areas = mod3$hidden.areas,
#                                   root.type = mod3$root.type, root.p = mod3$root.p,
#                                   aic = mod3$AIC, n.cores = 4)
#  recon.mod4 <- MarginReconGeoSSE(phy = mod4$phy, data = mod4$data, f = mod4$f,
#                                   pars = mod4$solution, hidden.areas = mod4$hidden.areas,
#                                   root.type = mod4$root.type, root.p = mod4$root.p,
#                                   aic = mod4$AIC, n.cores = 4)

## ---- eval=TRUE----------------------------------------------------------
## Load previous results:
load( "geohisse_recons_vignette.Rsave" )

## ---- eval=TRUE----------------------------------------------------------
recon.mod1
recon.mod2
recon.mod3
recon.mod4

## ---- eval=TRUE----------------------------------------------------------
recon.models <- list(recon.mod1, recon.mod2, recon.mod3, recon.mod4)
model.ave.rates <- GetModelAveRates(x = recon.models, type = "tips")

## ---- eval=TRUE----------------------------------------------------------
head( model.ave.rates )

## ----fig1, fig.height = 15, fig.width = 5--------------------------------
plot.geohisse.states(x = recon.models, rate.param = "net.div", type = "fan", 
                     show.tip.label = FALSE, legend = FALSE)


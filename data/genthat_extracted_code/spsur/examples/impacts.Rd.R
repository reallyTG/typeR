library(spsur)


### Name: impacts
### Title: Direct, indirect and total effects estimated for a spatial SUR
###   model
### Aliases: impacts

### ** Examples


###############################################
### PURE CROSS SECTIONAL DATA(G>1; Tm=1) ######
###############################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
rm(list = ls()) # Clean memory
data(spc)
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA
## A SUR-SLM model.
spcsur.slm <-spsur3sls(Form = Tformula, data = spc, type = "slm", W = Wspc)
summary(spcsur.slm)
eff.spcsur.slm <- impacts(spcsur.slm, nsim = 30)
## No test: 
## Each case usually takes 1-2 minutes maximum

## A SUR-SDM model
spcsur.sdm <-spsurml(Form = Tformula, data = spc, type = "sdm", W = Wspc)
summary(spcsur.sdm)
eff.spcsur.sdm <- impacts(spcsur.sdm, nsim = 300)

## A SUR-SLX model
spcsur.slx <-spsurml(Form = Tformula, data = spc, type = "slx", W = Wspc)
summary(spcsur.slx)
eff.spcsur.slx <- impacts(spcsur.slx, nsim = 300)

## A SUR-SDEM model
spcsur.sdem <-spsurml(Form = Tformula, data = spc, type = "sdem", W = Wspc)
summary(spcsur.sdem)
eff.spcsur.sdem <- impacts(spcsur.sdem, nsim = 300)

## A SUR-SARAR model
spcsur.sarar <-spsurml(Form = Tformula, data = spc, type = "sarar", W = Wspc)
summary(spcsur.sarar)
eff.spcsur.sarar <- impacts(spcsur.sarar, nsim = 300)


####################################
######## G=1; Tm>1               ###
####################################

### Only execute if you have enough time...
rm(list = ls()) # Clean memory
data(NCOVR)
Tformula <- HR80  | HR90 ~ PS80 + UE80 | PS90 + UE90
## A SUR-SLM model
NCOVRSUR.slm <-spsurml(Form = Tformula, data = NCOVR, type = "slm", W = W)
summary(NCOVRSUR.slm)
eff.NCOVR.slm <- impacts(NCOVRSUR.slm, nsim = 100)

## End(No test)




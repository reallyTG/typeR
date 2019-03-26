library(cystiSim)


### Name: cystiRun
### Title: 'cystiRun' object
### Aliases: cystiRun initiate update.cystiRun print.cystiRun plot.cystiRun
###   prevalence

### ** Examples

## we will use the built-in Mbeya dataset
prevalence(pig_mbeya$cysti)
prevalence(man_mbeya$taenia)

## define transmission probabilities
ph2m <- 0.000174918
pl2m <- 0.000149501
m2p  <- 6.85E-05
e2p  <- 0.00022611

## first initiate the 'cystiRun' object
mod <- initiate(man_mbeya, pig_mbeya, ph2m, pl2m, m2p, e2p)

## update the model 240 cycles (=20 years)
## this is a burn-in period, needed to obtain steady state
mod <- update(mod, 240)

## apply human mass drug administration
mod <- do_man_mda(mod, efficacy = 0.70, coverage = 0.80)

## apply pig mass drug administration
mod <- do_pig_mda(mod, efficacy = 0.90, coverage = 0.90)

## update the model 120 more cycles (=10 years)
mod <- update(mod, 120)

## plot the cycles
plot(mod, from = 200, start = 40)




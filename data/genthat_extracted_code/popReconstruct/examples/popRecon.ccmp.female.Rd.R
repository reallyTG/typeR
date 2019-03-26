library(popReconstruct)


### Name: popRecon.ccmp.female
### Title: Female Dominant Cohort Component Projection
### Aliases: popRecon.ccmp.female

### ** Examples


data(burkina_faso_females)

(pop.input.mat <-
    popRecon.ccmp.female(pop=burkina.faso.females$baseline.pop.counts
                      ,surv=burkina.faso.females$survival.proportions
                      ,fert=burkina.faso.females$fertility.rates
                      ,mig=burkina.faso.females$migration.proportions
                      ))




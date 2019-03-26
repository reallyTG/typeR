library(CAMAN)


### Name: mixalg.boot
### Title: bootstrap replication / validation of finite mixture models
### Aliases: mixalg.boot mixalg.Boot mixboot
### Keywords: meta-analysis

### ** Examples

### POISSON data with weights: thai_cohort
data(thai_cohort)
m.thai <- mixalg(obs="counts", weights="frequency",
                 family="poisson", data=thai_cohort,
                 acc = 0.00003)
## Not run: boot <- mixalg.boot(m.thai, nboot=1000) #may take a few minutes

### POISSON data with observed and expected data: hepab
data(hepab)
mix <- mixalg(obs="observations",pop.at.risk="expected",family= "poisson",data=hepab)
## Not run: 
##D boot <- mixalg.boot(mix, nboot=250) #may take some time 
##D table(boot$numk.boot)
## End(Not run)




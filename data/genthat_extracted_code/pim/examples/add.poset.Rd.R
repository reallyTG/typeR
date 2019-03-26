library(pim)


### Name: add.poset
### Title: Add a poset to a pim.environment object
### Aliases: add.poset add.poset,pim.environment-method

### ** Examples


data(DysData)
Dysenv <- new.pim.env(DysData)
Dysenv
DysenvAll <- add.poset(Dysenv, overwrite = TRUE, 
                       compare = 'all', nobs = nobs(DysData))
compare(Dysenv)
compare(DysenvAll)                       






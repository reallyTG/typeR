library(metamisc)


### Name: ccalc
### Title: Calculate the concordance statistic
### Aliases: ccalc
### Keywords: concordance discrimination meta-analysis performance
###   statistic

### ** Examples

######### Validation of prediction models with a binary outcome #########
data(EuroSCORE)

# Calculate the c-statistic and its standard error
ccalc(cstat=c.index, cstat.se=se.c.index, cstat.cilb=c.index.95CIl, cstat.ciub=c.index.95CIu, 
      N=n, O=n.events, data=EuroSCORE, slab=Study)
  
# Calculate the logit c-statistic and its standard error
ccalc(cstat=c.index, cstat.se=se.c.index, cstat.cilb=c.index.95CIl, cstat.ciub=c.index.95CIu, 
      N=n, O=n.events, data=EuroSCORE, slab=Study, g="log(cstat/(1-cstat))")
                                                            




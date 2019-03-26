library(vitality)


### Name: vitality.k
### Title: Fitting routine for the 3-parameter vitality model.
### Aliases: vitality.k

### ** Examples

data(daphnia)
time <- daphnia$days
survival_fraction <- daphnia$lx

results.modk <- vitality.k(time = time,
                           sdata = survival_fraction,
                           rc.data=TRUE, 
                           se=FALSE,
                           gfit=FALSE, 
                           datatype="CUM", 
                           ttol=.000001, 
                           init.params=FALSE,
                           #init.params=c(0.075, 0.15, 0.001),
                           lower=c(0,-1,0), upper=c(100,50,50), 
                           pplot=TRUE, 
                           tlab="days", 
                           lplot=TRUE, 
                           cplot=TRUE, 
                           Iplot=TRUE, 
                           silent=FALSE)




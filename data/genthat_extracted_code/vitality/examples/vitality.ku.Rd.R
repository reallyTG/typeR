library(vitality)


### Name: vitality.ku
### Title: Fitting routine for the 4-parameter vitality model.
### Aliases: vitality.ku

### ** Examples

data(rainbow_trout_for_k)
time <- rainbow_trout_for_k$days
survival_fraction <- rainbow_trout_for_k$survival

results.modku <- vitality.ku(time = time,
                             sdata = survival_fraction,
                             rc.data=TRUE,
                             se=FALSE,
                             gfit=FALSE,
                             datatype="CUM",
                             ttol=.000001,
                             init.params=FALSE,
                             lower=c(0,-1,0,0),upper=c(100,100,50,50),
                             pplot=TRUE,
                             tlab="days",
                             lplot=TRUE,
                             cplot=TRUE,
                             Iplot=TRUE,
                             silent=FALSE,
                             L=0)




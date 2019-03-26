library(PoweR)


### Name: law0019.LocationCont
### Title: The Location Contaminated Distribution
### Aliases: law0019.LocationCont law0019
### Keywords: law, Location Contaminated

### ** Examples
res <- gensample(19,10000,law.pars=c(0.8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)




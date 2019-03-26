library(siplab)


### Name: assimilation
### Title: Compute Assimilation Indices
### Aliases: assimilation assimilation.pix

### ** Examples

a <- assimilation(finpines, infpar=list(a=1, b=4,
     smark="height"), afree=TRUE)
summary(a)
system.time(assimilation.pix(finpines))
system.time(assimilation(finpines))




library(eRm)


### Name: gofIRT
### Title: Various model tests and fit indices
### Aliases: gofIRT gofIRT.ppar summary.gof print.gof
### Keywords: models

### ** Examples

#Goodness-of-fit for a Rasch model
res <- RM(raschdat1)
pres <- person.parameter(res)
gof.res <- gofIRT(pres)
gof.res
summary(gof.res)




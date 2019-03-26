library(PKNCA)


### Name: exclude
### Title: Exclude data points or results from calculations or
###   summarization.
### Aliases: exclude exclude.default

### ** Examples

myconc <- PKNCAconc(data.frame(subject=1,
                               time=0:6,
                               conc=c(1, 2, 3, 2, 1, 0.5, 0.25)),
                    conc~time|subject)
exclude(myconc,
        reason="Carryover",
        mask=c(TRUE, rep(FALSE, 6)))




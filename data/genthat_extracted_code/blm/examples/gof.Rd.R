library(blm)


### Name: gof
### Title: Hosmer-lemeshow goodness-of-fit statistics for 'blm' and
###   'lexpit' objects.
### Aliases: gof

### ** Examples


data(ccdata)

ccdata$packyear <- ccdata$packyear+runif(nrow(ccdata))

# UNWEIGHTED GOF
fit <- blm(y~female+packyear,data = ccdata)
gof(fit)

# WEIGHTED GOF
fit <- blm(y~female+packyear,data = ccdata, weight = ccdata$w)
gof(fit)





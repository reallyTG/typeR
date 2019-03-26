library(MUS)


### Name: MUS.combine
### Title: Combine MUS objects (joining strata into a full set).
### Aliases: MUS.combine
### Keywords: MUS audit

### ** Examples


## Simple Example
# Assume 500 invoices, each between 1 and 1000 monetary units
stratum.1 <- data.frame(book.value=round(runif(n=500, min=1, max=1000)))
plan.1 <- MUS.planning(data=stratum.1, tolerable.error=100000, expected.error=20000)

stratum.2 <- data.frame(book.value=round(runif(n=500, min=1, max=1000)))
plan.2 <- MUS.planning(data=stratum.2, tolerable.error=100000, expected.error=20000)

plan.combined <- MUS.combine(list(plan.1, plan.2))

print(plan.combined)




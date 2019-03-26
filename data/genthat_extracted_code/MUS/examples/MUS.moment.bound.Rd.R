library(MUS)


### Name: MUS.moment.bound
### Title: Calculate the moment bound for a Monetary Unit Sampling
###   evaluation.
### Aliases: MUS.moment.bound
### Keywords: MUS audit

### ** Examples


sample = c(rep(0, 96), -.16, .04, .18, .47)
MUS.moment.bound(sample)

# Assume 500 invoices, each between 1 and 1000 monetary units
data <- data.frame(book.value=round(runif(n=500, min=1, max=1000)))
# Plan a sample and cache it
plan <- MUS.planning(data=data, tolerable.error=10000, expected.error=2000)
# Extract a sample and cache it (no high values exist in this example)
extract <- MUS.extraction(plan)
# Copy book value into a new column audit values, and inject some error
audited <- extract$sample$book.value*(1-rbinom(nrow(extract$sample), 1, 0.05))
audited <- cbind(extract$sample, audit.value=audited)
# Evaluate the sample, cache and print it
evaluation <- MUS.evaluation(extract, audited)
MUS.moment.bound(evaluation)





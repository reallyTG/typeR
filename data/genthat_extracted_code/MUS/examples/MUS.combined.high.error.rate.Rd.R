library(MUS)


### Name: MUS.combined.high.error.rate
### Title: Calculate a high error rate bound for a combined Monetary Unit
###   Sampling evaluation.
### Aliases: MUS.combined.high.error.rate
### Keywords: MUS audit

### ** Examples


# Assume 500 invoices, each between 1 and 1000 monetary units
data1 <- data.frame(book.value=round(runif(n=500, min=1, max=1000)))
# Plan a sample and cache it
plan1 <- MUS.planning(data=data1, tolerable.error=10000, expected.error=2000)
# Extract a sample and cache it (no high values exist in this example)
extract1 <- MUS.extraction(plan1)
# Copy book value into a new column audit values, and inject some error
audited1 <- extract1$sample$book.value*(1-rbinom(nrow(extract1$sample), 1, 0.05))
audited1 <- cbind(extract1$sample, audit.value=audited1)
# Evaluate the sample, cache and print it
evaluation1 <- MUS.evaluation(extract1, audited1)

# Assume 500 invoices, each between 1 and 1000 monetary units
data2 <- data.frame(book.value=round(runif(n=500, min=1, max=1000)))
# Plan a sample and cache it
plan2 <- MUS.planning(data=data2, tolerable.error=10000, expected.error=2000)
# Extract a sample and cache it (no high values exist in this example)
extract2 <- MUS.extraction(plan2)
# Copy book value into a new column audit values, and inject some error
audited2 <- extract2$sample$book.value*(1-rbinom(nrow(extract2$sample), 1, 0.05))
audited2 <- cbind(extract2$sample, audit.value=audited2)
# Evaluate the sample, cache and print it
evaluation2 <- MUS.evaluation(extract2, audited2)

combined <- MUS.combine(list(evaluation1, evaluation2))
MUS.combined.high.error.rate(combined)





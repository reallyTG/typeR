library(MUS)


### Name: MUS-package
### Title: Monetary Unit Sampling and Estimation Methods, Widely Used in
###   Auditing
### Aliases: MUS-package MUS
### Keywords: MUS audit

### ** Examples

## Simple Example
library(MUS)
# Assume 500 invoices, each between 1 and 1000 monetary units
example.data.1 <- data.frame(book.value=round(runif(n=500, min=1,
max=1000)))
# Plan a sample and cache it
plan.results.simple <- MUS.planning(data=example.data.1,
tolerable.error=100000, expected.error=20000)
# Extract a sample and cache it (no high values exist in this example)
extract.results.simple <- MUS.extraction(plan.results.simple)
# Copy book values into a new column audit values
audited.sample.simple <- extract.results.simple$sample
audited.sample.simple <- cbind(audited.sample.simple,
audit.value=audited.sample.simple$book.value)
# Edit manually (if any audit difference occur)
#audited.sample.simple <- edit(audited.sample.simple)
# Evaluate the sample, cache and print it
evaluation.results.simple <- MUS.evaluation(extract.results.simple,
audited.sample.simple)
print(evaluation.results.simple)




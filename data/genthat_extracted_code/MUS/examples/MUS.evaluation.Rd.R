library(MUS)


### Name: MUS.evaluation
### Title: Evaluate a sample using Monetary Unit Sampling.
### Aliases: MUS.evaluation
### Keywords: MUS audit

### ** Examples

## Simple Example
# Assume 500 invoices, each between 1 and 1000 monetary units
example.data.1 <- data.frame(book.value=round(runif(n=500, min=1,
max=1000)))
# Plan a sample and cache it
plan.results.simple <- MUS.planning(data=example.data.1,
tolerable.error=100000, expected.error=20000)
# Extract a sample and cache it (no high values exist in this example)
extract.results.simple <- MUS.extraction(plan.results.simple)
# Copy book value into a new column audit values
audited.sample.simple <- extract.results.simple$sample
audited.sample.simple <- cbind(audited.sample.simple,
audit.value=audited.sample.simple$book.value)
# Edit manually (if any audit difference occur)
#audited.sample.simple <- edit(audited.sample.simple)
# Evaluate the sample, cache and print it
evaluation.results.simple <- MUS.evaluation(extract.results.simple,
audited.sample.simple)
print(evaluation.results.simple)

## Advanced Example
example.data.2 <- data.frame(own.name.of.book.values=round(runif(n=500,
min=1, max=1000)))
plan.results.advanced <- MUS.planning(data=example.data.2,
col.name.book.values="own.name.of.book.values", confidence.level=.70,
tolerable.error=100000, expected.error=20000, n.min=3)
extract.results.advanced <- MUS.extraction(plan.results.advanced,
start.point=5, seed=1, obey.n.as.min=TRUE)
extract.results.advanced <- MUS.extraction(plan.results.advanced)
audited.sample.advanced <- extract.results.advanced$sample
audited.sample.advanced <- cbind(audited.sample.advanced,
own.name.of.audit.values=audited.sample.advanced$own.name.of.book.values)
#audited.sample.advanced <- edit(audited.sample.advanced)
evaluation.results.advanced <- MUS.evaluation(extract.results.advanced,
audited.sample.advanced,
col.name.audit.values="own.name.of.audit.values")
print(evaluation.results.advanced)




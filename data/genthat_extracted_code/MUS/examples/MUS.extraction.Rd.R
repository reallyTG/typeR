library(MUS)


### Name: MUS.extraction
### Title: Extract a sample using Monetary Unit Sampling.
### Aliases: MUS.extraction
### Keywords: MUS audit

### ** Examples

## Simple Example
# Assume 500 invoices, each between 1 and 1000 monetary units
example.data.1 <- data.frame(book.value=round(runif(n=500, min=1,
max=1000)))
# Plan a sample and cache it
plan.results.simple <- MUS.planning(data=example.data.1,
tolerable.error=100000, expected.error=20000)
# Extract a sample and cache it
extract.results.simple <- MUS.extraction(plan.results.simple)

## Advanced Example
example.data.2 <- data.frame(own.name.of.book.values=round(runif(n=500,
min=1, max=1000)))
plan.results.advanced <- MUS.planning(data=example.data.2,
col.name.book.values="own.name.of.book.values", confidence.level=.70,
tolerable.error=100000, expected.error=20000, n.min=3)
extract.results.advanced <- MUS.extraction(plan.results.advanced,
start.point=5, seed=0, obey.n.as.min=TRUE)




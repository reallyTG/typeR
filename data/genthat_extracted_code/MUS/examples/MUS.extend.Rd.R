library(MUS)


### Name: MUS.extend
### Title: Extend a MUS sample.
### Aliases: MUS.extend
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
extract1 <- MUS.extraction(plan.results.simple)

# extends the sample by 20 itens
extract2 <- MUS.extend(extract1, 20)





library(dfcrm)


### Name: cohere
### Title: Coherence of two-stage CRM
### Aliases: cohere
### Keywords: datasets

### ** Examples

prior <- c(0.05, 0.10, 0.20, 0.35, 0.50, 0.70)
x0 <- c(rep(1,3), rep(2,3), rep(3,3), rep(4,3), rep(5,3), rep(6,9))

# The above design is coherent when target rate = 0.20
foo <- cohere(prior, target=0.2, x0)
foo

# The design is incoherent if a larger target DLT rate is used.
foo2 <- cohere(prior, target=0.3, x0)




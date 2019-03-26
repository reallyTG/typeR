library(SALTSampler)


### Name: Logit
### Title: Logit of a Probability Vector
### Aliases: Logit

### ** Examples

#Find logit on natural scale
a <- c(0.4, 0.4, 0.1, 0.1)
Logit(p = a)

#Find logit on log scale
b <- c(log(1e-4), log(1e-6), log(1 - 1e-6))
b <- b/sum(b)
Logit(p = b, logp = FALSE)




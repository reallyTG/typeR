library(reliaR)


### Name: GenExp
### Title: The Generalized Exponential (GE) distribution
### Aliases: GenExp dgen.exp pgen.exp qgen.exp rgen.exp
### Keywords: distribution

### ** Examples

## Load data set
data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 5.28321139, lambda.est = 0.03229609

dgen.exp(bearings, 5.28321139, 0.03229609, log = FALSE)
pgen.exp(bearings, 5.28321139, 0.03229609, lower.tail = TRUE, 
    log.p = FALSE)
qgen.exp(0.25, 5.28321139, 0.03229609, lower.tail = TRUE, log.p = FALSE)
rgen.exp(10, 5.28321139, 0.03229609)




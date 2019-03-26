library(DescTools)


### Name: RevWeibull
### Title: The Reverse Weibull Distribution
### Aliases: dRevWeibull pRevWeibull qRevWeibull rRevWeibull dNegWeibull
###   pNegWeibull qNegWeibull rNegWeibull
### Keywords: distribution

### ** Examples

dRevWeibull(-5:-3, -1, 0.5, 0.8)
pRevWeibull(-5:-3, -1, 0.5, 0.8)
qRevWeibull(seq(0.9, 0.6, -0.1), 2, 0.5, 0.8)
rRevWeibull(6, -1, 0.5, 0.8)
p <- (1:9)/10
pRevWeibull(qRevWeibull(p, -1, 2, 0.8), -1, 2, 0.8)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9




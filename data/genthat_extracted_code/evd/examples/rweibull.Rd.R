library(evd)


### Name: rweibull
### Title: The Reverse Weibull Distribution
### Aliases: drweibull prweibull qrweibull rrweibull dnweibull pnweibull
###   qnweibull rnweibull
### Keywords: distribution

### ** Examples

drweibull(-5:-3, -1, 0.5, 0.8)
prweibull(-5:-3, -1, 0.5, 0.8)
qrweibull(seq(0.9, 0.6, -0.1), 2, 0.5, 0.8)
rrweibull(6, -1, 0.5, 0.8)
p <- (1:9)/10
prweibull(qrweibull(p, -1, 2, 0.8), -1, 2, 0.8)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9




library(DescTools)


### Name: GenExtrVal
### Title: The Generalized Extreme Value Distribution
### Aliases: dGenExtrVal pGenExtrVal qGenExtrVal rGenExtrVal
### Keywords: distribution

### ** Examples

dGenExtrVal(2:4, 1, 0.5, 0.8)
pGenExtrVal(2:4, 1, 0.5, 0.8)
qGenExtrVal(seq(0.9, 0.6, -0.1), 2, 0.5, 0.8)
rGenExtrVal(6, 1, 0.5, 0.8)
p <- (1:9)/10
pGenExtrVal(qGenExtrVal(p, 1, 2, 0.8), 1, 2, 0.8)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9




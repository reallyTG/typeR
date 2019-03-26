library(DescTools)


### Name: GenPareto
### Title: The Generalized Pareto Distribution
### Aliases: dGenPareto pGenPareto qGenPareto rGenPareto
### Keywords: distribution

### ** Examples

dGenPareto(2:4, 1, 0.5, 0.8)
pGenPareto(2:4, 1, 0.5, 0.8)
qGenPareto(seq(0.9, 0.6, -0.1), 2, 0.5, 0.8)
rGenPareto(6, 1, 0.5, 0.8)
p <- (1:9)/10
pGenPareto(qGenPareto(p, 1, 2, 0.8), 1, 2, 0.8)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9




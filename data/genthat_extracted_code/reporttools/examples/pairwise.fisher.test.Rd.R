library(reporttools)


### Name: pairwise.fisher.test
### Title: Pairwise Fisher's exact test
### Aliases: pairwise.fisher.test
### Keywords: dplot aplot

### ** Examples

set.seed(1977)
x <- factor(abs(round(rnorm(99, 0, 1))))
g <- factor(round(runif(99, 0, 2)))
pairwise.fisher.test(x, g, p.adjust.method = "holm")




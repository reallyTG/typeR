library(metamedian)


### Name: qe.study.level
### Title: Study-Level application of quantile estimation method
### Aliases: qe.study.level

### ** Examples

## Generate S2 summary data
set.seed(1)
n <- 100
x <- stats::rlnorm(n, 2.5, 1)
quants <- stats::quantile(x, probs = c(0.25, 0.5, 0.75))

## Estimate sampling variance of the median
qe.study.level(q1.g1 = quants[1], med.g1 = quants[2], q3.g1 = quants[3],
               n.g1 = n)





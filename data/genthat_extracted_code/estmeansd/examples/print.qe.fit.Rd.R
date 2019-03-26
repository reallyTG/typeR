library(estmeansd)


### Name: print.qe.fit
### Title: Print method for objects of class "qe.fit"
### Aliases: print.qe.fit

### ** Examples

## Generate S2 summary data
set.seed(1)
n <- 100
x <- stats::rlnorm(n, 2.5, 1)
quants <- stats::quantile(x, probs = c(0.25, 0.5, 0.75))

## Fit distributions
res <- qe.fit(q1.val = quants[1], med.val = quants[2], q3.val = quants[3],
       n = n)
print(res)





library(estmeansd)


### Name: print.bc.mean.sd
### Title: Print method for objects of class "bc.mean.sd"
### Aliases: print.bc.mean.sd

### ** Examples

## Generate S2 summary data
set.seed(1)
n <- 1000
x <- stats::rlnorm(n, 2.5, 1)
quants <- stats::quantile(x, probs = c(0.25, 0.5, 0.75))
obs.mean <- mean(x)
obs.sd <- stats::sd(x)

## Estimate the sample mean and standard deviation using the BC method
res <- bc.mean.sd(q1.val = quants[1], med.val = quants[2],
    q3.val = quants[3], n = n)
print(res)





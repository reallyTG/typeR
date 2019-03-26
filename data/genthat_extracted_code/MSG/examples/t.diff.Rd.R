library(MSG)


### Name: t.diff
### Title: The differences of P-values in t test assuming equal or unequal
###   variances
### Aliases: t.diff

### ** Examples

data(t.diff)
boxplot(t.diff, axes = FALSE, xlab = expression(n[1]))
axis(1)
axis(2)
box()

## reproducing the data
if (interactive()) {
    set.seed(123)
    t.diff = NULL
    for (n1 in 2:100) {
        t.diff = rbind(t.diff, replicate(1000, {
            x1 = rnorm(n1, mean = 0, sd = runif(1, 0.5, 1))
            x2 = rnorm(30, mean = 1, sd = runif(1, 2, 5))
            t.test(x1, x2, var.equal = TRUE)$p.value - t.test(x1, x2, 
                var.equal = FALSE)$p.value
        }))
    }
    t.diff = as.data.frame(t(t.diff))
    colnames(t.diff) = 2:100
}




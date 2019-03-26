library(MKmisc)


### Name: pairwise.fun
### Title: Compute pairwise values for a given function
### Aliases: pairwise.fun
### Keywords: univar

### ** Examples

set.seed(13)
x <- rnorm(100)
g <- factor(sample(1:4, 100, replace = TRUE))
levels(g) <- c("a", "b", "c", "d")
pairwise.fun(x, g, fun = function(x, y) t.test(x,y)$p.value)
## in contrast to
pairwise.t.test(x, g, p.adjust.method = "none", pool.sd = FALSE)




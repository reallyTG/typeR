library(ggdistribute)


### Name: post_int
### Title: Posterior intervals
### Aliases: post_int

### ** Examples

x <- rpois(5000, 15)
ints <- post_int(x, warn = FALSE)
hist(x, br=50)
abline(v=ints$c, col="cyan")
abline(v=ints[, c("l.wide", "r.wide")], col="magenta")

post_int(x, "median", warn = FALSE)
post_int(x, "mean", warn = FALSE)
post_int(x, "mode", adj=2, rope = c(14, 16), warn = FALSE)




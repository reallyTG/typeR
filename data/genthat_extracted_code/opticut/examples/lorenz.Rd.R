library(opticut)


### Name: lorenz
### Title: Lorenz Curve Based Thresholds and Partitions
### Aliases: lorenz summary.lorenz print.summary.lorenz quantile.lorenz
###   iquantile iquantile.lorenz plot.lorenz
### Keywords: manip misc

### ** Examples

set.seed(1)
x <- c(rexp(100, 10), rexp(200, 1))

l <- lorenz(x)
head(l)
tail(l)
summary(l)
summary(unclass(l))

(q <- c(0.05, 0.5, 0.95))
(p_i <- quantile(l, probs=q, type="p"))
iquantile(l, values=p_i, type="p")
(p_i <- quantile(l, probs=q, type="L"))
iquantile(l, values=p_i, type="L")

op <- par(mfrow=c(2,1))
plot(l, lwd=2, tangent=2, h=3, v=4)
abline(0, 1, lty=2, col="grey")
abline(1, -1, lty=2, col="grey")
plot(l, type="x", lwd=2, h=3, v=4)
par(op)

## Lorenz-tangent approach to binarize a multi-level problem
n <- 100
g <- as.factor(sort(sample(LETTERS[1:4], n, replace=TRUE, prob=4:1)))
x <- rpois(n, exp(as.integer(g)))
mu <- aggregate(x, list(g), mean)
(l <- lorenz(mu$x, table(g)))
(s <- summary(l))

plot(l)
abline(0, 1, lty=2)
lines(rep(s["p[t]"], 2), c(s["p[t]"], s["L[t]"]), col=2)




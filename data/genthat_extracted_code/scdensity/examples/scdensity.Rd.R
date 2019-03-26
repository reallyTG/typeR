library(scdensity)


### Name: scdensity
### Title: Shape-constrained kernel density estimation.
### Aliases: scdensity density

### ** Examples

# Default method gives a unimodal estimate using adjustment curve method.
x <- rlnorm(30)
scKDE <- scdensity(x)
scKDE
summary(scKDE)
plot(scKDE, detail=2)
plot(scKDE, detail=4)

# Constrain the first and fourth quartiles to be monotone, using greedy sharpening method.
x <- rt(50, df=3)
scKDE <- scdensity(x, bw="SJ", adjust=0.5, constraint=c("monotoneL", "monotoneR"),
                   opts=list(verbose=TRUE, leftTail=25, rightTail=75), method="greedy")
plot(scKDE)

# Compare unimodal, twoInflections, and twoInflections+ constraints
x <- rnorm(100)
h <- 0.5 * bw.SJ(x)
fhat1 <- scdensity(x, bw=h, constraint="unimodal")
fhat2 <- scdensity(x, bw=h, constraint="twoInflections")
fhat3 <- scdensity(x, bw=h, constraint="twoInflections+")
plot(density(x, bw=h))
lines(fhat1$x, fhat1$y, col="red")
lines(fhat2$x, fhat2$y, col="blue")
lines(fhat3$x, fhat3$y, col="green", lwd=2)





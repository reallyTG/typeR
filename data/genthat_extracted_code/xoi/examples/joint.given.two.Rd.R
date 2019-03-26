library(xoi)


### Name: joint.given.two
### Title: Crossover locations given there are two
### Aliases: joint.given.two
### Keywords: distribution

### ** Examples


# Calculate the distribution of the average of the crossover locations,
# given that there are two and that they are separated by 20 cM
# (for a chromosome of length 200 cM)
L <- 200
d <- 20
x <- seq(0, L-d, by=0.5)
y <- x+d

f <- joint.given.two(4.3, L=L, x, y)
f$f <- f$f / distance.given.two(4.3, L, d)$f
plot((f$x+f$y)/2, f$f, type="l", xlim=c(0, L), ylim=c(0,max(f$f)),
     lwd=2, xlab="Average location", ylab="Density")
abline(v=c(d/2,L-d/2), h=1/(L-d), lty=2, lwd=2)





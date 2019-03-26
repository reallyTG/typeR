library(mined)


### Name: mined
### Title: Minimum Energy Design
### Aliases: mined
### Keywords: Bayesian Computation Quasi-Monte Carlo Experimental Design

### ** Examples

require(mined)
p <- 2
n <- 109 # largest prime number less than 100+5p
initial <- Lattice(n, p)

# suppose x1 is in [-40,40] and x2 in [-25,10]
logf <- function(para)
{
  l1 <- -40
  u1 <- 40
  l2 <- -25
  u2 <- 10
  x1 <- l1 + (u1 - l1) * para[1]
  x2 <- l2 + (u2 - l2) * para[2]
  val <- -.5 * (x1 ^2 / 100 + (x2+ .03 * x1^2 -3)^2)
  return(val)
}

res <- mined::mined(initial, logf)
dim(res$points)
dim(res$cand)

x1 <- seq(0, 1, length.out = 200)
x2 <- seq(0, 1, length.out = 200)
y <- matrix(0.0, 200, 200)
for(i in 1:200)
{
  for(j in 1:200)
  {
    y[i, j] = logf(c(x1[i], x2[j]))
  }
}
image(x1, x2, exp(y), col = cm.colors(5), xlab = expression(x[1]), ylab = expression(x[2]))
points(res$cand[, 1], res$cand[, 2], pch = 11, col = rgb(red = 0, green = 0, blue = 1, 
       alpha = 0.35), cex = .25)
points(res$points[, 1], res$points[, 2], pch = 17, col = 'black', cex = .75)
legend("bottom", c('Candidates points', 'MinED samples'), pch = c(11, 17), 
        col = c(rgb(red = 0, green = 0, blue = 1, alpha = 0.35), 'black'), 
        inset = .02, bg = 'transparent', bty = 'n')




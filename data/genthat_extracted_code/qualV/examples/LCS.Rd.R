library(qualV)


### Name: LCS
### Title: Algorithm for the Longest Common Subsequence Problem
### Aliases: LCS
### Keywords: misc

### ** Examples

# direct use
a <- c("b", "c", "a", "b", "c", "b")
b <- c("a", "b", "c", "c", "b")
print(LCS(a, b))

# a constructed example
x <- seq(0, 2 * pi, 0.1)  # time
y <- 5 + sin(x)           # a process
o <- y + rnorm(x, sd=0.2) # observation with random error
p <- y + 0.1              # simulation with systematic bias
plot(x, o); lines(x, p)

lcs <- LCS(f.slope(x, o), f.slope(x, p))  # too much noise
lcs$LLCS
lcs$QSI

os <- ksmooth(x, o, kernel = "normal", bandwidth = dpill(x, o), x.points = x)$y
lcs <- LCS(f.slope(x, os), f.slope(x, p))
lcs$LLCS
lcs$QSI


# observed and measured data with non-matching time intervals
data(phyto)
bbobs    <- dpill(obs$t, obs$y)
n        <- tail(obs$t, n = 1) - obs$t[1] + 1
obsdpill <- ksmooth(obs$t, obs$y, kernel = "normal", bandwidth = bbobs,
                    n.points = n)
obss     <- data.frame(t = obsdpill$x, y = obsdpill$y)
obss     <- obss[match(sim$t, obss$t),]
obs_f1   <- f.slope(obss$t, obss$y)
sim_f1   <- f.slope(sim$t, sim$y)
lcs      <- LCS(obs_f1, sim_f1)
lcs$QSI




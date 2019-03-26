library(qualV)


### Name: qvalLCS
### Title: Qualitative Validation by Means of Interval Sequences and LCS
### Aliases: qvalLCS print.qvalLCS plot.qvalLCS summary.qvalLCS
### Keywords: misc

### ** Examples

# a constructed example
x <- seq(0, 2*pi, 0.1)
y <- 5 + sin(x)           # a process
o <- y + rnorm(x, sd=0.2) # observation with random error
p <- y + 0.1              # simulation with systematic bias

qvalLCS(o, p)
qvalLCS(o, p, smooth="both", feature="f.curve")

qv <- qvalLCS(o, p, smooth = "obs")
print(qv)
plot(qv, ylim=c(3, 8))

# observed and measured data with non-matching time steps
data(phyto)
qvlcs <- qvalLCS(obs$y, sim$y, obs$t, sim$t, smooth = "obs")

basedate <- as.Date("1960/1/1")
qvlcs$o$x   <- qvlcs$o$x + basedate
qvlcs$obs$x <- qvlcs$obs$x + basedate
qvlcs$sim$x <- qvlcs$sim$x + basedate
qvlcs$obs.lcs$x <- qvlcs$obs.lcs$x + basedate
qvlcs$sim.lcs$x <- qvlcs$sim.lcs$x + basedate

plot.qvalLCS(qvlcs)
summary(qvlcs)




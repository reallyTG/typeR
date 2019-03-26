library(qualV)


### Name: EF
### Title: Efficiency Factor as Suggested by Nash and Sutcliffe
### Aliases: EF
### Keywords: misc

### ** Examples

# a constructed example
x <- seq(0, 2*pi, 0.1)
y <- 5 + sin(x)           # a process
o <- y + rnorm(x, sd=0.2) # observation with random error
p <- y + 0.1              # simulation with systematic bias

plot(x, o); lines(x, p)
EF(o, p)

# observed and measured data with non-matching time intervals
data(phyto)
obsb <- na.omit(obs[match(sim$t, obs$t), ])
simb <- sim[na.omit(match(obs$t, sim$t)), ]
EF(obsb$y, simb$y)




library(qualV)


### Name: GRI
### Title: A Geometric Reliability Index as Suggested by Leggett & Williams
### Aliases: GRI
### Keywords: misc

### ** Examples

# a constructed example
x <- seq(0, 2*pi, 0.1)
y <- 5 + sin(x)             # a process
o <- y + rnorm(x, sd = 0.2) # observation with random error
p <- y + 0.1                # simulation with systematic bias

plot(x, o); lines(x, p)
GRI(o, p)

# observed and measured data with non-matching time intervals
data(phyto)
obsb <- na.omit(obs[match(sim$t, obs$t), ])
simb <- sim[na.omit(match(obs$t, sim$t)), ]
GRI(obsb$y, simb$y)




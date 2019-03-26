library(bursts)


### Name: plot.bursts
### Title: Plots a burst model
### Aliases: plot.bursts
### Keywords: hplot

### ** Examples

offsets <- c(seq(0, 400, 100), seq(410, 450, 5), seq(451, 470, 2),
             seq(480, 600, 5), 700, seq(710, 800, 5), 900, 1000)
bursts <- kleinberg(offsets)
plot(bursts)




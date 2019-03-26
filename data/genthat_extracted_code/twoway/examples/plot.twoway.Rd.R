library(twoway)


### Name: plot.twoway
### Title: Plot methods for two-way tables
### Aliases: plot.twoway plot.twoway.fit plot.twoway.diagnose

### ** Examples

data(taskRT)
tw <- twoway(taskRT)
tw
twmed <- twoway(taskRT, method="median")
twmed
plot(tw,    xlim=c(2,7), ylim=c(2,7)) ## use the same xlim and ylim, for comparison
plot(twmed, xlim=c(2,7), ylim=c(2,7))

plot(tw,    which="diagnose", xlim=c(-.19, .19), ylim=c(-.5, .55))
plot(twmed, which="diagnose", xlim=c(-.19, .19), ylim=c(-.5, .55))

data(insectCounts)
twi <- twoway(insectCounts)
twimed <- twoway(insectCounts, method="median")

plot(twi,    xlim=c(-250, 700), ylim=c(-180, 900))
plot(twimed, xlim=c(-250, 700), ylim=c(-180, 900))

plot(twi,    which="diagnose", xlim=c(-160, 170), ylim=c(-200, 400))  ## power = .1
plot(twimed, which="diagnose", xlim=c(-160, 170), ylim=c(-200, 400))  ## power = .3





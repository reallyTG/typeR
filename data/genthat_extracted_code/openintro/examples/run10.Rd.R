library(openintro)


### Name: run10
### Title: Cherry Blossom 10 mile run data, 2009
### Aliases: run10 run10Samp run10_09
### Keywords: datasets

### ** Examples

data(run10)

#===> men's times <===#
histPlot(run10$time[run10$gender == 'M'])

#===> times by gender <===#
densityPlot(run10$time, run10$gender, key=c('M','F'))
legend('topright', lty=2:1, col=c('red','black'),
       legend=c('M','F'))

#===> Examine Sample <===#
data(run10Samp)




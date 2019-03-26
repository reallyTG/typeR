library(longCatEDA)


### Name: longContPlot
### Title: Plot Continuous Longitudinal Data
### Aliases: longContPlot

### ** Examples

# longitudinal plot
times <- c(1,100,200,300,400,500)
par(mfrow=c(1,1), bg='cornsilk3')
longContPlot(example2cont, times, ylim=c(-2,6), main='', ylab='', xlab='Day')
par(mfrow=c(1,1), bg='transparent')

# jogging example
times <- c(1,100,200,300,400,500)
par(mfrow=c(1,2), bg='cornsilk3')
longContPlot(example2cat, times,           ylim=c(0,6), 
  main='Growth Curves', ylab='', xlab='Days')
longContPlot(example2cat, times, jog=TRUE, ylim=c(0,6), 
  main='Growth Curves + Jogging', 
	ylab='', xlab='Days')
par(mfrow=c(1,1), bg='transparent')# compare growth curves to longCat





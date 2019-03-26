library(hydroTSM)


### Name: drawTimeAxis
### Title: Customized Time Axis
### Aliases: drawTimeAxis drawxaxis

### ** Examples

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- window(SanMartinoPPts, end=as.Date("1930-12-31"))

## Plotting the daily ts only, and then automatic 'x' axis
plot(x, xaxt = "n", xlab="Time")
drawTimeAxis(x) 

## Plotting the daily ts only, and then monthly ticks in the 'x' axis, 
## with annual labels.
plot(x, xaxt = "n", xlab="Time")
drawTimeAxis(x, tick.tstep="months", lab.tstep="years") 




library(sitools)


### Name: f2si
### Title: f2si converts floating-point number to a string with SI prefixes
### Aliases: f2si
### Keywords: utilities misc engeneering physics chemistry conversion aplot
###   units

### ** Examples

library(sitools)

# convert single number
f2si(10000)

# convert single number with unit
f2si(0.023, unit="V")

# convert list of numbers
numbers <- c(1e5, 3.5e19, 0.004)
f2si(numbers)


# how to create fancy axis labels
# generate some data
xdata <- 10^(0:10)
ydata <- sin(xdata)^2

# lets assume the ticks should be at 1,2,4 ..10,20,40...
tickvalues <- 10^(0:10) 

# plot the data and generate axis
plot(x=xdata, y=ydata, log="x", xlim=c(1,1e10),  xaxt="n",xlab="Frequency (Hz)")
axis(1, at=tickvalues, labels=f2si(tickvalues))




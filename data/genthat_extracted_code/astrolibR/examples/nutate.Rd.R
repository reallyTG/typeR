library(astrolibR)


### Name: nutate
### Title: Calculate the nutation in longitude and obliquity for a given
###   Julian date
### Aliases: nutate
### Keywords: misc

### ** Examples

# Find the nutation in longitude and obliquity 1987 on Apr 10 at Oh.
# Result: nut_long = -3.788    nut_obliq = 9.443
# This is example 22.a from Meeus

jul = jdcnv(1987,4,10,0)
nutate(jul)
       
# Plot the large-scale variation of the nutation in longitude 
# during the 20th century. This plot will reveal the dominant 18.6 year
# period, but a finer grid is needed to display the shorter periods in 
# the nutation.


yr = 1900 + seq(0,100)    # establish sequence of years      
jul = jdcnv(yr,1,1,0)          # find Julian date of first day of year
out = nutate(jul)               # compute nutation
plot(yr, out$nut_long, lty=1, lwd=2, xlab='Year', ylab='Nutation longitude (degrees)')




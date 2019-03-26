library(TeachingDemos)


### Name: plot2script
### Title: Create a script from the current plot
### Aliases: plot2script
### Keywords: iplot dplot

### ** Examples

if(interactive()){

# create a plot
plot(runif(10),rnorm(10))
lines( seq(0,1,length=10), rnorm(10,1,3) )

# create the script
plot2script()

# now paste the script into a script window or text processor.
# edit the ranges in plot.window() and change some colors or
# other options.  Then run the script.
 }




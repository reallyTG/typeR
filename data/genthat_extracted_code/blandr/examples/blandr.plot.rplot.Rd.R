library(blandr)


### Name: blandr.plot.rplot
### Title: Bland-Altman plotting function, using basic R drawing functions
### Aliases: blandr.plot.rplot

### ** Examples

# Generates two random measurements
measurement1 <- rnorm(100)
measurement2 <- rnorm(100)

# Generates a basic plot
# Do note the blandr.plot.rplot function wasn't meant to be used on it's own
# and is generally called via the bland.altman.display.and.draw function

# Passes data to the blandr.statistics function to generate Bland-Altman statistics
statistics.results <- blandr.statistics( measurement1 , measurement2 )
# Passed data to the blandr.plot.limits function to generate plot limits
plot.limits <- blandr.plot.limits( statistics.results )

# Generates a basic plot, with no optional arguments
blandr.plot.rplot( statistics.results , plot.limits )

# Generates a basic plot, with title changed
blandr.plot.rplot( statistics.results , plot.limits , plotTitle = 'Bland-Altman example plot' )
# Generates a basic plot, with title changed, and confidence intervals off
blandr.plot.rplot( statistics.results , plot.limits , plotTitle = 'Bland-Altman example plot' ,
ciDisplay = FALSE , ciShading = FALSE )





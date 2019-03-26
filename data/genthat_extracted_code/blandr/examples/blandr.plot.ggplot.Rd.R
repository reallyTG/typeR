library(blandr)


### Name: blandr.plot.ggplot
### Title: Bland-Altman plotting function, using ggplot2
### Aliases: blandr.plot.ggplot

### ** Examples

# Generates two random measurements
measurement1 <- rnorm(100)
measurement2 <- rnorm(100)

# Generates a ggplot
# Do note the ggplot function wasn't meant to be used on it's own
# and is generally called via the bland.altman.display.and.draw function

# Passes data to the blandr.statistics function to generate Bland-Altman statistics
statistics.results <- blandr.statistics( measurement1 , measurement2 )

# Generates a ggplot, with no optional arguments
blandr.plot.ggplot( statistics.results )

# Generates a ggplot, with title changed
blandr.plot.ggplot( statistics.results , plotTitle = "Bland-Altman example plot" )

# Generates a ggplot, with title changed, and confidence intervals off
blandr.plot.ggplot( statistics.results , plotTitle = "Bland-Altman example plot" ,
ciDisplay = FALSE , ciShading = FALSE )





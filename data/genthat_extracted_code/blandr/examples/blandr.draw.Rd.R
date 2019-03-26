library(blandr)


### Name: blandr.draw
### Title: Bland-Altman drawing function for R
### Aliases: blandr.draw

### ** Examples

# Generates two random measurements
measurement1 <- rnorm(100)
measurement2 <- rnorm(100)

# Generates a plot, with no optional arguments
blandr.draw( measurement1 , measurement2 )

# Generates a plot, using the in-built R graphics
blandr.draw( measurement1 , measurement2 , plotter = 'rplot' )

# Generates a plot, with title changed
blandr.draw( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' )

# Generates a plot, with title changed, and confidence intervals off
blandr.draw( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' ,
ciDisplay = FALSE , ciShading = FALSE )





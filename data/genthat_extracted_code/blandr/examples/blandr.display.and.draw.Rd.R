library(blandr)


### Name: blandr.display.and.draw
### Title: Bland-Altman display and draw for R
### Aliases: blandr.display.and.draw

### ** Examples

# Generates two random measurements
measurement1 <- rnorm(100)
measurement2 <- rnorm(100)

# Generates a plot, with no optional arguments
blandr.display.and.draw( measurement1 , measurement2 )

# Generates a plot, with title
blandr.display.and.draw( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' )





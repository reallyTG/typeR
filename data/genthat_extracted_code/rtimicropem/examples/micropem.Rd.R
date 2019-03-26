library(rtimicropem)


### Name: micropem
### Title: An R6 class to represent MicroPEM output information.
### Aliases: micropem
### Keywords: data

### ** Examples

data("micropemChai")
# Plot method, type = "plain" by default.
micropemChai$plot()
# Example with type = "interactive", for RStudio viewer,
# RMardown html documents and Shiny apps.
## Not run: 
##D library("rbokeh")
##D p <- micropemChai$plot(type = "interactive")
##D p
##D # Summary method
##D micropemChai$summary()
##D # Print method
##D micropemChai$print()
## End(Not run)




library(grattan)


### Name: progressivity
### Title: Compute the progressivity
### Aliases: progressivity

### ** Examples


I <- c(10e3, 20e3, 50e3, 100e3, 150e3)
progressivity(I, 0.3 * I) # zero
progressivity(I, income_tax(I, "2017-18"))





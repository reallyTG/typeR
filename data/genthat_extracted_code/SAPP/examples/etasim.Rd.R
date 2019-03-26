library(SAPP)


### Name: etasim
### Title: Simulation of Earthquake Dataset Based on the ETAS Model
### Aliases: etasim1 etasim2
### Keywords: spatial

### ** Examples

## by Gutenberg-Richter's Law 
etasim1(1.0, 999, 3.5, 3.5, c(0.2e-02, 0.4e-02, 0.3e-02, 0.24e+01, 0.13e+01))

## from a etas-format dataset
data(main2003JUL26)  # The aftershock data of 26th July 2003 earthquake of M6.2
etasim2(main2003JUL26, 0.01, 2.5, 6.2,
        c(0, 0.63348e+02, 0.38209e-01, 0.26423e+01, 0.10169e+01))




library(SAPP)


### Name: respoi
### Title: The Residual Point Process of the ETAS Model
### Aliases: respoi respoi2
### Keywords: spatial

### ** Examples

data(main2003JUL26)  # The aftershock data of 26th July 2003 earthquake of M6.2 

# output transformed times and cumulative numbers
x <- main2003JUL26
respoi(x$time, x$magnitude, c(0,0.96021E+02,0.58563E-01,0.96611E+00),
       0.0, 0.01, 18.68, 2.5)

# output a res-format dataset
respoi2(main2003JUL26, c(0,0.96021E+02,0.58563E-01,0.96611E+00),
        0.0, 0.01, 18.68, 2.5)




library(SAPP)


### Name: etarpp
### Title: Residual Point Process of the ETAS Model
### Aliases: etarpp etarpp2
### Keywords: spatial

### ** Examples

data(main2003JUL26)  # The aftershock data of 26th July 2003 earthquake of M6.2

## output transformed times and cumulative numbers
x <- main2003JUL26
etarpp(x$time, x$magnitude, 2.5, 6.2,
       c(0, 0.63348E+02, 0.38209E-01, 0.26423E+01, 0.10169E+01),, 0.01, 7, 18.68)

## output a res-format dataset
etarpp2(main2003JUL26, 2.5, 6.2,
        c(0, 0.63348E+02, 0.38209E-01, 0.26423E+01, 0.10169E+01),, 0.01, 7, 18.68)





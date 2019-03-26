library(rccmisc)


### Name: is.scalar_in
### Title: Test if scalar is in intervall
### Aliases: is.scalar_in is.scalar_in01

### ** Examples

is.scalar_in01(.5) # TRUE
is.scalar_in01(5) # FALSE
is.scalar_in01(seq(0,1,.1)) # FALSE

is_scalar_in09 <- is.scalar_in(0,9)
is_scalar_in09(5) # TRUE




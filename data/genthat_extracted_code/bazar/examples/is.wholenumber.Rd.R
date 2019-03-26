library(bazar)


### Name: is.wholenumber
### Title: Test if the values of a vector are whole numbers
### Aliases: is.wholenumber as.wholenumber

### ** Examples

x = c(1L, 10L)
is.integer(x)
is.wholenumber(x)

x = c(1, 10)
is.integer(x)
is.wholenumber(x) # here is the difference with 'is.integer'

is.wholenumber(1+10^(-7))
is.wholenumber(1+10^(-8))





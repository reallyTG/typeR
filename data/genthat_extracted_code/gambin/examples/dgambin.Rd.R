library(gambin)


### Name: dgambin
### Title: The mixture gambin distribution
### Aliases: dgambin pgambin rgambin qgambin gambin_exp

### ** Examples

## maxoctave is 4. So zero for x = 5
dgambin(0:5, 1, 4)

## Equal weightings between components
dgambin(0:5, alpha = c(1,2), maxoctave = c(4, 4))

## Zero weight on the second component, i.e. a 1 component model
dgambin(0:5, alpha = c(1,2), maxoctave = c(4, 4), w = c(1, 0))
expected = gambin_exp(4, 13, total_species = 200)
plot(expected, type = "l")

##draw random values from a gambin distribution 
x = rgambin(1e6, alpha = 2, maxoctave = 7) 
x = table(x)
freq = as.vector(x)
values = as.numeric(as.character(names(x)))
abundances = data.frame(octave=values, species = freq)
fit_abundances(abundances, no_of_components = 1)






library(constants)


### Name: syms
### Title: Lists Containing All Symbols.
### Aliases: syms syms_with_errors syms_with_units
### Keywords: datasets

### ** Examples

# the speed of light
with(syms, c0)

# the Planck constant
attach(syms)
hbar

detach(syms); attach(syms_with_errors)
hbar

detach(syms_with_errors); attach(syms_with_units)
hbar





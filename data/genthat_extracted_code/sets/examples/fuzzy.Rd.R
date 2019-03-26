library(sets)


### Name: fuzzy
### Title: Fuzzy logic
### Aliases: .N. .T. .S. .I. fuzzy_logic
### Keywords: math

### ** Examples

x <- c(0.7, 0.8)
y <- c(0.2, 0.3)

## Use default family ("Zadeh")
.N.(x)
.T.(x, y)
.S.(x, y)
.I.(x, y)

## Switch family and try again
fuzzy_logic("Fodor")
.N.(x)
.T.(x, y)
.S.(x, y)
.I.(x, y)




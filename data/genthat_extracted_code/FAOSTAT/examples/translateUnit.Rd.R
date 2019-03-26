library(FAOSTAT)


### Name: translateUnit
### Title: Function to translate multipliers
### Aliases: translateUnit

### ** Examples

## Create numeric vector
myUnit = c(1000, 1e6, 1000, 1e9, 1e9, 1e12)

## Translate numeric to character
myUnit2 = translateUnit(myUnit)
myUnit2

## Now translate back
translateUnit(myUnit2)




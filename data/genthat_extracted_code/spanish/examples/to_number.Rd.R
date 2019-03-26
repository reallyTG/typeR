library(spanish)


### Name: to_number
### Title: translate spanish spelled quantities into their integer
###   counterparts.
### Aliases: to_number
### Keywords: currency, euros money,

### ** Examples

to_number("mil trescientos noventa y dos")

1392

## Example dataframe is provided: cantidades

cantidades$var3 <- lapply(cantidades$var2, to_number)





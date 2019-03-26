library(eeptools)


### Name: decomma
### Title: Remove commas from numeric fields and return them as numerics
### Aliases: decomma

### ** Examples

input <- c("10,243", "11,212", "7,011", "5443", "500")
output <- decomma(input)
is.numeric(output)





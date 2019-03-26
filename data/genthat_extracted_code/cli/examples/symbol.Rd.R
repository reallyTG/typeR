library(cli)


### Name: symbol
### Title: Various handy symbols to use in a command line UI
### Aliases: symbol

### ** Examples

cat(symbol$tick, " SUCCESS\n", symbol$cross, " FAILURE\n", sep = "")

## All symbols
cat(paste(format(names(symbol), width = 20),
  unlist(symbol)), sep = "\n")




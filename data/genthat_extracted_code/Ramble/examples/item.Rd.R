library(Ramble)


### Name: item
### Title: 'item' is a parser that consumes the first character of the
###   string and returns the rest. If it cannot consume a single character
###   from the string, it will emit the empty list, indicating the parser
###   has failed.
### Aliases: item

### ** Examples

item() ("abc")
item() ("")




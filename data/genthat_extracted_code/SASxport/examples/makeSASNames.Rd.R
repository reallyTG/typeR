library(SASxport)


### Name: makeSASNames
### Title: Create valid and unique SAS names from a character vector.
### Aliases: makeSASNames
### Keywords: manip

### ** Examples

  ## Simple example: no duplicates or more than 8 characters
  makeSASNames( c("height","weight","age","gender"))

  ## Resolve duplicates
  makeSASNames( c("a","a","b","b","b","c") )

  ## Truncate long names
  makeSASNames( c("alphabetic", "numeric", "alphanumeric", "whitespace"))

  ## Truncate and make unique
  makeSASNames( rep( c("aaaaaaaaaaa","bbbbbbbbbb"), each=3) )

  ## Now do it quietly!
  makeSASNames( rep( c("aaaaaaaaaaa","bbbbbbbbbb"), each=3), quiet=TRUE)




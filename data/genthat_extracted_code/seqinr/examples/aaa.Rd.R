library(seqinr)


### Name: aaa
### Title: Converts amino-acid one-letter code into the three-letter one
### Aliases: aaa
### Keywords: utilities

### ** Examples

  #
  # Show all possible input values:
  #
  
  a()
  
  #
  # Convert them in one letter-code:
  #
  
  aaa(a())
  
  #
  # Check consistency of results:
  #
  
  stopifnot(a(aaa(a())) == a())
  
  #
  # Show what happens with non-allowed values:
  #
  
  aaa("Z") # should be NA and a warning is generated




library(seqinr)


### Name: a
### Title: Converts amino-acid three-letter code into the one-letter one
### Aliases: a
### Keywords: utilities

### ** Examples

  #
  # Show all possible input values:
  #
  
  aaa()
  
  #
  # Convert them in one letter-code:
  #
  
  a(aaa())
  
  #
  # Check consistency of results:
  #
  
  stopifnot( aaa(a(aaa())) == aaa())
  
  #
  # Show what happens with non-allowed values:
  #
  
  a("SOS") # should be NA and a warning is generated




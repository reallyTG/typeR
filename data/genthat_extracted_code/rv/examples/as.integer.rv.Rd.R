library(rv)


### Name: as.integer.rv
### Title: Integer Random vectors
### Aliases: as.integer.rv
### Keywords: classes

### ** Examples


  x <- rvpois(lambda=3)   # some integer-valued random variable
  print(x)
  is.integer(x)           # FALSE, because by default x is 'double'!
  x <- as.integer(x)      # coerce to integer
  is.integer(x)           # TRUE
  print(x)                # Shows also the 'min' and 'max' columns





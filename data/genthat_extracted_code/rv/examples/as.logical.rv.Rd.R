library(rv)


### Name: as.logical.rv
### Title: Logical Random vectors
### Aliases: as.logical.rv
### Keywords: classes

### ** Examples


  x <- rvbern(prob=0.5)   # some 0/1 valued random variable
  print(x)
  is.logical(x)           # FALSE, because by default x is 'double'
  x <- as.logical(x)      # coerce to logical; all zeros become FALSE, ones become TRUE
  is.logical(x)           # TRUE
  print(x)                # Shows the expectations and not the quantiles





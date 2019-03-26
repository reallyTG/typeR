library(spatstat)


### Name: rectcontact
### Title: Contact Distribution Function using Rectangular Structuring
###   Element
### Aliases: rectcontact
### Keywords: spatial nonparametric

### ** Examples

  ## make an image which is TRUE/FALSE inside/outside the letter R
  V <- letterR
  Frame(V) <- grow.rectangle(Frame(V), 0.5)
  Z <- as.im(V, value=TRUE, na.replace=FALSE)
  ## analyse
  plot(rectcontact(Z))




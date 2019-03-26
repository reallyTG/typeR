library(spatstat)


### Name: pcfmulti
### Title: Marked pair correlation function
### Aliases: pcfmulti
### Keywords: spatial nonparametric

### ** Examples

  adult <- (marks(longleaf) >= 30)
  juvenile <- !adult
  p <- pcfmulti(longleaf, adult, juvenile)




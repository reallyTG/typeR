library(spatstat)


### Name: summary.quad
### Title: Summarizing a Quadrature Scheme
### Aliases: summary.quad print.summary.quad
### Keywords: spatial methods

### ** Examples

  # make a quadrature scheme
  Q <- quadscheme(rpoispp(42))
  # summarize it
  summary(Q)
  # save the summary
  s <- summary(Q)
  # print it
  print(s)
  s
  # extract total quadrature weight
  s$w$all$sum




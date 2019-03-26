library(ripa)


### Name: plot.imagematrix
### Title: Plotting an imagematrix object
### Aliases: plot.imagematrix
### Keywords: misc

### ** Examples

  op <- par(mfrow=c(1,2))

  data(logo)
  plot(logo, main="plot(logo)")
  plot(logo^2, main="plot(logo^2)")

  par(op)




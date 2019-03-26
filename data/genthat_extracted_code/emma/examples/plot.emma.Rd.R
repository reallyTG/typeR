library(emma)


### Name: plot.emma
### Title: 3D simulation plot
### Aliases: plot.emma
### Keywords: ~Optimization

### ** Examples

  in.name <- c("x1","x2")
  nlev <- c(20, 20)
  lower <- c(-3, -3)
  upper <- c(3, 3)
  out.name <- "y"
  weight <- 1
  C <- 20
  pr.mut <- c(0.1, 0.07, 0.04, rep(0.01, C-3))

  emma.peaks<-emma(in.name, nlev, lower, upper, out.name, opt = "mx", 
	nd = 10, na = 5, weight, C , w1 = 0.7, w2 = 0.4, c1i = 2.5, 
	c1f = 0.5, c2i = 0.5, c2f = 2.5, b = 5, pr.mut, graph = "no", 
	fn1 = peaks)

  plot(emma.peaks, fn = peaks, n = 50, C = 20)





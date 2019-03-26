library(cpr)


### Name: plot.cpr_bs
### Title: Plot B-splines
### Aliases: plot.cpr_bs

### ** Examples

bmat <- bsplines(seq(-3, 2, length = 1000), iknots = c(-2, 0, 0.2))
plot(bmat, show_xi = TRUE,  show_x = TRUE)
plot(bmat, show_xi = FALSE, show_x = TRUE)
plot(bmat, show_xi = TRUE,  show_x = FALSE)  ## Default
plot(bmat, show_xi = FALSE, show_x = FALSE)




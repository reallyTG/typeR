library(cosa)


### Name: plot
### Title: Power and MDES Curves
### Aliases: plot.power plot.mdes plot.cosa

### ** Examples

d1 <- mdes.bcrd3r2(rho2 = .10, rho3 = .20, omega3 = .30,
                   n1 = 20, n2 = 44, n3 = 50)
plot(d1, xpar = "n3", xlim = c(30, 100))




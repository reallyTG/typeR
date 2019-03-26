library(PPQplan)


### Name: ti.ctplot
### Title: Heatmap/Contour Plot for Assessing Power of the PPQ Plan using
###   Tolerance Interval.
### Aliases: ti.ctplot

### ** Examples


mu <- seq(95,105,0.1)
sigma <- seq(0.1,2.5,0.1)
ti.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%",
mu = mu, sigma = sigma, Llim=95, Ulim=105)

ti.ctplot(attr.name = "Extractable Volume", attr.unit = "% of NV=1mL",
Llim = 100, Ulim = Inf, mu=seq(100, 110, 0.5), sigma=seq(0.2, 15 ,0.5), n=40,
alpha = 0.05, coverprob = 0.675, side=1)





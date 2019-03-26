library(PPQplan)


### Name: PPQ.ggplot
### Title: Heatmap/Contour GGPlot for Dynamically Assessing Power of the
###   CQA PPQ Plan Using General Multiplier.
### Aliases: PPQ.ggplot

### ** Examples

mu <- seq(95, 105, 0.1)
sigma <- seq(0.1,1.7,0.1)
PPQ.ggplot(attr.name = "Sterile Concentration Assay", attr.unit = "%", Llim=95, Ulim=105,
mu = mu, sigma = sigma, k=2.373, dynamic = FALSE)
test <- data.frame(mu=c(97,98.3,102.5), sd=c(0.55, 1.5, 0.2))
PPQ.ggplot(attr.name = "Sterile Concentration Assay", attr.unit = "%", Llim=95, Ulim=105,
mu = mu, sigma = sigma, k=2.373, test.point = test)





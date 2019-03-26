library(PPQplan)


### Name: PPQ.ctplot
### Title: Heatmap/Contour Plot for Assessing Power of the CQA PPQ Plan
###   Using General Multiplier.
### Aliases: PPQ.ctplot

### ** Examples

mu <- seq(1.6,3.4,0.05)
sigma <- seq(0.05,0.8,0.01)
PPQ.ctplot(attr.name = "Total Protein", attr.unit = "mg/mL", Llim=1.5, Ulim=3.5,
mu = mu, sigma = sigma, k=2.373)

## Example verifying simulation resutls in the textbook page 249
mu <- seq(95, 105, 0.1)
sigma <- seq(0.2, 5, 0.1)
PPQ.ctplot(attr.name = "Composite Assay", attr.unit = "%LC", Llim=95, Ulim=105,
mu = mu, sigma = sigma, k=2.373)
mu <- seq(90, 110, 0.5)
PPQ.ctplot(attr.name = "Composite Assay", attr.unit = "%LC", Llim=90, Ulim=110,
mu = mu, sigma = sigma, k=2.373)

mu <- seq(95,105,0.1)
sigma <- seq(0.1,2.5,0.1)
PPQ.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%", Llim=95, Ulim=105,
mu = mu, sigma = sigma, k=2.373)
test <- data.frame(mean=c(97,98.3,102.5), sd=c(0.55, 1.5, 1.2))
PPQ.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%", Llim=95, Ulim=105,
mu = mu, sigma = sigma, k=2.373, test.point=test)





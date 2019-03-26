library(PPQplan)


### Name: pi.ctplot
### Title: Heatmap/Contour Plot for Assessing Power of the CQA PPQ Plan
###   Using Prediction Interval.
### Aliases: pi.ctplot

### ** Examples


## Example verifying simulation resutls in the textbook page 249
mu <- seq(95, 105, 0.1)
sigma <- seq(0.2, 3.5, 0.1)
pi.ctplot(attr.name = "Composite Assay", attr.unit = "%LC",
mu = mu, sigma = sigma, Llim=95, Ulim=105)
mu <- seq(90, 110, 0.5)
pi.ctplot(attr.name = "Composite Assay", attr.unit = "%LC",
mu = mu, sigma = sigma, Llim=90, Ulim=110)

mu <- seq(95,105,0.1)
sigma <- seq(0.1,2.5,0.1)
pi.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%",
mu = mu, sigma = sigma, Llim=95, Ulim=105)
test <- data.frame(mean=c(97,98.3,102.5), sd=c(0.55, 1.5, 1.2))
pi.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%", Llim=95, Ulim=105,
mu = mu, sigma = sigma, test.point=test)




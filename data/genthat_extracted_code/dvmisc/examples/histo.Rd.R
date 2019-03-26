library(dvmisc)


### Name: histo
### Title: Histogram with Added Options
### Aliases: histo

### ** Examples

# Generate 10,000 Poisson(2) values. Compare default histograms from hist vs. 
# histo.
set.seed(123)
x <- rpois(n = 10000, lambda = 2)
par(mfrow = c(1, 2))
hist(x)
histo(x)

# Generate 10,000 lognormal(0, 0.35) values. Create histograms with curves
# showing fitted log-normal and normal PDFs.
set.seed(123)
x <- rlnorm(n = 10000, meanlog = 0, sdlog = 0.35)
par(mfrow = c(1, 2))
histo(x, "lnorm", main = "Log-normal curve")
histo(x, "norm", main = "Normal curve")

# Generate 10,000 Binomial(8, 0.25) values. Create histogram, specifying 
# size = 5, with blue line/points showing fitted PMF.
set.seed(123)
x <- rbinom(n = 10000, size = 5, prob = 0.25)
par(mfrow = c(1, 1))
histo(x, "binom", size = 5, points.list = list(type = "b", col = "blue"))





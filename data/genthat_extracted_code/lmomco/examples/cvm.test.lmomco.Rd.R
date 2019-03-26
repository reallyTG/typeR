library(lmomco)


### Name: cvm.test.lmomco
### Title: Cramér-von Mises Test for Goodness-of-Fit
### Aliases: cvm.test.lmomco
### Keywords: goodness-of-fit Cramer--von Mises statistic

### ** Examples

# An example in which the test is conducted on a sample but the parent is known.
# This will lead to more precise inference than if the sample parameters are used.
mu <- 120; sd <- 25; para <- vec2par(c(120,25), type="nor")
x <- rnorm(56, mean=mu, sd=sd)
T1 <- cvm.test.lmomco(x, para)$statistic
T2 <- goftest::cvm.test(x, null="pnorm", mean=mu, sd=sd)$statistic
message("Cramer--von Mises: T1=", round(T1, digits=6), " and T2=", round(T2, digits=6))




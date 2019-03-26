library(Rdistance)


### Name: uniform.like
### Title: Uniform likelihood function for distance analyses
### Aliases: uniform.like
### Keywords: models

### ** Examples

x <- seq(0, 100, length=100)

# Plots showing effects of changes in Threshold
plot(x, uniform.like(c(20, 20), x), type="l", col="red")
plot(x, uniform.like(c(40, 20), x), type="l", col="blue")

# Plots showing effects of changes in Knee
plot(x, uniform.like(c(50, 100), x), type="l", col="red")
plot(x, uniform.like(c(50, 1), x), type="l", col="blue")

         




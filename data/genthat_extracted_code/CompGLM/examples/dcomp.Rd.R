library(CompGLM)


### Name: dcomp
### Title: Conway-Maxwell-Poisson Probability Density Function
### Aliases: dcomp

### ** Examples

dcomp(-5:5, 2.5, 1)
dcomp(2, 2.5, 1.5)
require(graphics)
require(stats)
comp <- dcomp(0:10, 2.5, 0.9)
poisson <- dpois(0:10, 2.5)
barplot(rbind(comp, poisson), beside = TRUE, names= 0:10, legend.text = TRUE)




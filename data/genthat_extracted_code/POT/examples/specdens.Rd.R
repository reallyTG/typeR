library(POT)


### Name: specdens
### Title: Spectral Density Plot
### Aliases: specdens
### Keywords: hplot models

### ** Examples

par(mfrow=c(1,2))
##Spectral density for a Markov Model
mc <- simmc(1000, alpha = 0.25, model = "log")
mc <- qgpd(mc, 0, 1, 0.1)
Mclog <- fitmcgpd(mc, 0, "log")
specdens(Mclog)
##Spectral density for a bivariate POT model
x <- rgpd(500, 5, 1, -0.1)
y <- rgpd(500, 2, 0.2, -0.25)
Manlog <- fitbvgpd(cbind(x,y), c(5,2), "anlog")
specdens(Manlog)




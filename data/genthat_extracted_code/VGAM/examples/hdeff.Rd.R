library(VGAM)


### Name: hdeff
### Title: Hauck-Donner Effects: A Detection Test for Wald Tests
### Aliases: hdeff hdeff.vglm
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let, data = pneumo,
            trace = TRUE, crit = "c",  # Get some more accuracy
            cumulative(reverse = TRUE,  parallel = TRUE))
cumulative()@infos()$hadof  # Analytical solution implemented
hdeff(fit)
hdeff(fit, deriv = 1)  # Analytical solution
hdeff(fit, deriv = 2)  # It is a partial analytical solution
hdeff(fit, deriv = 2, se.arg = TRUE,
      fd.only = TRUE)  # All derivatives solved numerically by FDs




library(dr4pl)


### Name: IC
### Title: Obtain Inhibitory Concentrations (IC) of a dose-response curve
### Aliases: IC

### ** Examples

data.test <- data.frame(x = c(0.0001, 0.001, 0.01, 0.1, 1),
                        y = c(10, 9, 5, 1, 0))
obj.dr4pl <- dr4pl(y ~ x,
                   data = data.test)
IC(obj.dr4pl, inhib.percent = c(10, 90))

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_4)  # Fit a 4PL model to data
IC(obj.dr4pl, inhib.percent = c(10, 50, 90))





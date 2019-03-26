library(VGAM)


### Name: waitakere
### Title: Waitakere Ranges Data
### Aliases: waitakere
### Keywords: datasets

### ** Examples

fit <- vgam(agaaus ~ s(altitude, df = 2), binomialff, waitakere)
head(predict(fit, waitakere, type = "response"))
## Not run:  plot(fit, se = TRUE, lcol = "orange", scol = "blue") 




library(sperrorest)


### Name: ecuador
### Title: J. Muenchow's Ecuador landslide data set
### Aliases: ecuador
### Keywords: datasets internal

### ** Examples

data(ecuador)
str(ecuador)
library(rpart)
ctrl <- rpart.control(cp = 0.02)
fit <- rpart(slides ~ dem + slope + hcurv + vcurv +
   log.carea + cslope, data = ecuador, control = ctrl)
par(xpd = TRUE)
plot(fit, compress = TRUE, main = 'Muenchows landslide data set')
text(fit, use.n = TRUE)




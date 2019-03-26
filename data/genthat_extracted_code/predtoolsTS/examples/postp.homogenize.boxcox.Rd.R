library(predtoolsTS)


### Name: postp.homogenize.boxcox
### Title: Undo Box-Cox transformation
### Aliases: postp.homogenize.boxcox

### ** Examples

p <- prep.homogenize.boxcox(AirPassengers)
postp.homogenize.boxcox(p$tserie,p$lambda)




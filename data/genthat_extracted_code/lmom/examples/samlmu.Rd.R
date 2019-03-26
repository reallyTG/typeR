library(lmom)


### Name: samlmu
### Title: Sample L-moments
### Aliases: samlmu samlmu.s .samlmu
### Keywords: univar

### ** Examples

data(airquality)
samlmu(airquality$Ozone, 6)

# Trimmed L-moment ratios
samlmu(airquality$Ozone, trim=1)




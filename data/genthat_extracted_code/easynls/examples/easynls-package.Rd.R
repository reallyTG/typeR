library(easynls)


### Name: easynls-package
### Title: Easy Nonlinear Model
### Aliases: easynls-package easynls

### ** Examples

time=c(2,6,9,24,48,72,96)
deg=c(20,33,46,55,66,72,76)

data5=data.frame(time,deg)

nlsfit(data5, model=12)




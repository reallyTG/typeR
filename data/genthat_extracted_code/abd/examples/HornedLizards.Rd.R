library(abd)


### Name: HornedLizards
### Title: Horn Length and Predation Status of Horned Lizards
### Aliases: HornedLizards
### Keywords: datasets

### ** Examples

str(HornedLizards)

histogram(~horn.length | group, HornedLizards,
  layout=c(1,2),
  xlab="Horn Length (mm)")




library(mmpf)


### Name: uniformGrid
### Title: method to create a uniform grid on a variable
### Aliases: uniformGrid

### ** Examples


data = data.frame(
  w = seq(0, 1, length.out = 5),
  x = factor(letters[1:5]),
  y = ordered(1:5),
  z = 1:5
)

lapply(data, uniformGrid, length.out = 5)




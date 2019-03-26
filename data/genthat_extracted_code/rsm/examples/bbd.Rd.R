library(rsm)


### Name: bbd
### Title: Generate a Box-Behnken design
### Aliases: bbd
### Keywords: design

### ** Examples

library(rsm)

### Simple 3-factor case, not randomized so structure is evident
bbd(3, randomize=FALSE)

### 5-factor BBD, divided between two plants
bbd(y1 + y2 ~ A + B + C + D + E,  n0 = 5,  block = "Plant")




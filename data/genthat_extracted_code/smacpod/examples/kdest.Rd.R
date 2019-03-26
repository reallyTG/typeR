library(smacpod)


### Name: kdest
### Title: Difference of estimated K functions
### Aliases: kdest

### ** Examples

data(grave)
kd1 = kdest(grave)
plot(kd1, iso ~ r, ylab = "difference", legend = FALSE, main = "")
kd2 = kdest(grave, nsim = 9, level = 0.8)
plot(kd2)




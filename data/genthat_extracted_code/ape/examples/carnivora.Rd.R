library(ape)


### Name: carnivora
### Title: Carnivora body sizes and life history traits
### Aliases: carnivora
### Keywords: datasets

### ** Examples

data(carnivora)
## Fig. 1 in Gittleman (1986):
plot(carnivora$BW ~ carnivora$FW, pch = (1:8)[carnivora$Family], log = "xy",
     xlab = "Female body weight (kg)", ylab = "Birth weigth (g)",
     ylim = c(1, 2000))
legend("bottomright", legend = levels(carnivora$Family), pch = 1:8)
plot(carnivora$BW ~ carnivora$FB, pch = (1:8)[carnivora$Family], log = "xy",
     xlab = "Female brain weight (g)", ylab = "Birth weigth (g)",
     ylim = c(1, 2000))
legend("bottomright", legend = levels(carnivora$Family), pch = 1:8)




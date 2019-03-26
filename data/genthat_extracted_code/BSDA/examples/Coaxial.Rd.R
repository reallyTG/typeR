library(BSDA)


### Name: Coaxial
### Title: Signal loss from three types of coxial cable
### Aliases: Coaxial
### Keywords: datasets

### ** Examples


boxplot(signal ~ cable, data = Coaxial, col = c("red", "green", "yellow"))
kruskal.test(signal ~ cable, data = Coaxial)





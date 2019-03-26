library(rcompanion)


### Name: cramerV
### Title: Cramer's V (phi)
### Aliases: cramerV

### ** Examples

### Example with table
data(Anderson)
fisher.test(Anderson)
cramerV(Anderson)

### Example with two vectors
Species = c(rep("Species1", 16), rep("Species2", 16))
Color   = c(rep(c("blue", "blue", "blue", "green"),4),
            rep(c("green", "green", "green", "blue"),4))
fisher.test(Species, Color)
cramerV(Species, Color)





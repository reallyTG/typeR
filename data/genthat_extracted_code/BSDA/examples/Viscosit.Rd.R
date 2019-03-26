library(BSDA)


### Name: Viscosit
### Title: Viscosity measurements of a substance on two different days
### Aliases: Viscosit
### Keywords: datasets

### ** Examples


boxplot(Viscosit$first, Viscosit$second, col = "blue")
t.test(Viscosit$first, Viscosit$second, var.equal = TRUE)





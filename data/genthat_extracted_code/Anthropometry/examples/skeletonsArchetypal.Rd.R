library(Anthropometry)


### Name: skeletonsArchetypal
### Title: Skeleton plot of archetypal individuals
### Aliases: skeletonsArchetypal
### Keywords: array

### ** Examples

#List with the measurements of each archetype (Table 7 of Epifanio et al (2013)):
lista_arch <- list()
lista_arch[[1]] <- c(34.18, 25.85, 18.65, 39.66, 35.05, 26.73)
lista_arch[[2]] <- c(28.51, 21.23, 15.39, 33.57, 29.24, 21.26)
lista_arch[[3]] <- c(35.34, 24.94, 18.79, 36.7, 32.28, 23.41)
lista_arch[[4]] <- c(31.34, 22.27, 16.89, 38, 33.08, 25.8)
lista_arch[[5]] <- c(32.33, 25.09, 17.84, 34.46, 29.58, 22.82)
lista_arch[[6]] <- c(29.69, 24.18, 18.22, 38.07, 33.04, 24.56)
lista_arch[[7]] <- c(29.24, 22.97, 14.99, 36.88, 32.28, 24.22)

for(i in 1:length(lista_arch)){
 titlePlot <- paste("Archetype", i, sep = " ")
 skeletonsArchetypal(lista_arch[[i]],titlePlot)
}

#Note: For an example for archetypoids, see www.uv.es/vivigui/softw/more_examples.R 




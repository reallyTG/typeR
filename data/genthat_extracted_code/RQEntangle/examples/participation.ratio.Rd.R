library(RQEntangle)


### Name: participation.ratio
### Title: Calculate the participation ratio given the calculate Schmidt
###   modes.
### Aliases: participation.ratio

### ** Examples

singlet<- matrix(c(0, sqrt(0.7), sqrt(0.3), 0), byrow = TRUE, nrow = 2)
modes<- schmidt.decompose(singlet)
participation.ratio(modes)





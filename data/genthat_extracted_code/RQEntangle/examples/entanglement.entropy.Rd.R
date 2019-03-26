library(RQEntangle)


### Name: entanglement.entropy
### Title: Calculate the entanglement entropy given the calculate Schmidt
###   modes.
### Aliases: entanglement.entropy

### ** Examples

singlet<- matrix(c(0, sqrt(0.7), sqrt(0.3), 0), byrow = TRUE, nrow = 2)
modes<- schmidt.decompose(singlet)
entanglement.entropy(modes)





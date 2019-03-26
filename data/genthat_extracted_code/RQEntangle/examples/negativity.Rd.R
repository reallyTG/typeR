library(RQEntangle)


### Name: negativity
### Title: Calculate the negativity given the calculate Schmidt modes.
### Aliases: negativity

### ** Examples

singlet<- matrix(c(0, sqrt(0.7), sqrt(0.3), 0), byrow = TRUE, nrow = 2)
modes<- schmidt.decompose(singlet)
negativity(modes)





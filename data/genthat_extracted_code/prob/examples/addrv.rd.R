library(prob)


### Name: addrv
### Title: Adding Random Variables to a Probability Space
### Aliases: addrv
### Keywords: manip

### ** Examples

S <-rolldie(3, makespace = TRUE)
addrv(S, sum, name = "Y")
addrv(S, Z = X3 - X2 )




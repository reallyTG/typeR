library(VGAM)


### Name: Zoabeta
### Title: The Zero/One-Inflated Beta Distribution
### Aliases: Zoabeta dzoabeta pzoabeta qzoabeta rzoabeta
### Keywords: distribution

### ** Examples

## Not run: 
##D N <- 1000; y <- rzoabeta(N, 2, 3, 0.2, 0.2)
##D hist(y, probability = TRUE, border = "blue", las = 1,
##D      main = "Blue = 0- and 1-altered; orange = ordinary beta")
##D sum(y == 0) / N  # Proportion of 0s
##D sum(y == 1) / N  # Proportion of 1s
##D Ngrid <- 1000
##D lines(seq(0, 1, length = Ngrid),
##D       dbeta(seq(0, 1, length = Ngrid), 2, 3), col = "orange")
##D lines(seq(0, 1, length = Ngrid), col = "blue",
##D       dzoabeta(seq(0, 1, length = Ngrid), 2 , 3, 0.2, 0.2))
## End(Not run)




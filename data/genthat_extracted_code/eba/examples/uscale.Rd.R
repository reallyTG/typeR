library(eba)


### Name: uscale
### Title: Utility Scale of an EBA Choice Model
### Aliases: uscale
### Keywords: models

### ** Examples

data(drugrisk)
A <- list(c(1), c(2,7), c(3,7), c(4,7,8), c(5,7,8), c(6,7,8))
eba1 <- eba(drugrisk[,,group = "male30"], A)  # EBA model

uscale(eba1)                    # sum-to-unity normalization
uscale(eba1, norm=1)            # u(alcohol) := 1
uscale(eba1, norm=5)            # u(heroine) := 1
uscale(eba1, norm=NULL)         # no normalization
uscale(eba1, norm=1, log=TRUE)  # log utility scale, log u(alcohol) := 0




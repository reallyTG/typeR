library(nCopula)


### Name: pCompCop
### Title: Distribution function of Mother class objects
### Aliases: pCompCop

### ** Examples

## Create the structure
structure <- LOG(0.5, NULL, list(GAMMA(1/30, c(5,6), NULL),
                              LOG(0.1, NULL, list(GAMMA(1/30, c(1,2), NULL),
                              GAMMA(1/30, c(3,4), NULL)))))

## Character string
pCompCop(structure, vector = TRUE, express = TRUE)
pCompCop(structure, vector = FALSE, express = TRUE)

## Function
pCompCop(structure, vector = TRUE, express = FALSE)
pCompCop(structure, vector = FALSE, express = FALSE)





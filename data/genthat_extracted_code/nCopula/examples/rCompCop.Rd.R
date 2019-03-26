library(nCopula)


### Name: rCompCop
### Title: Random number generator for Mother class objects
### Aliases: rCompCop

### ** Examples

## Create the structure
structure <- GEO(0.1, 1, list(GAMMA(0.2, 2:3, NULL),
                        GEO(0.3, 4:5, NULL)))

## Sample from the structure
rCompCop(1000, structure)





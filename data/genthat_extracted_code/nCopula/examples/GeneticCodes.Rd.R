library(nCopula)


### Name: GeneticCodes
### Title: Obtain the Genetic Codes of a Structure
### Aliases: GeneticCodes

### ** Examples

## Create the structure
structure <- GEO(0.5, NULL, list(GAMMA(1/30, c(5,6), NULL),
                           GEO(0.1, NULL, list(GAMMA(1/30, c(1,2), NULL),
                                               GAMMA(1/30, c(3,4), NULL)))))
## Get the genetic codes
GeneticCodes(structure)





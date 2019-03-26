library(RpeakChrom)


### Name: vanDeemterAlternative
### Title: Characterization of chromatographic columns using a new
###   aproximation to vanDeemter equations.
### Aliases: vanDeemterAlternative

### ** Examples

coeff1 <- vanDeemterAlternative(col = col, ext = parameters_ext,
    dead = parameters_dead, length = 150, approachI = TRUE, A = 6, B = 200,
    C = 0.04, approachII = FALSE)

coeff2 <- vanDeemterAlternative(col = col, ext = parameters_ext,
    dead = parameters_dead, length = 150, approachI = FALSE, A = 6, B = 200,
    C = 0.04, approachII = TRUE)




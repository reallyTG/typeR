library(nlme)


### Name: LDEsysMat
### Title: Generate system matrix for LDEs
### Aliases: LDEsysMat
### Keywords: models

### ** Examples

# incidence matrix for a two compartment open system
incidence <-
  matrix(c(1,1,2,2,2,1,3,2,0), ncol = 3, byrow = TRUE,
   dimnames = list(NULL, c("Par", "From", "To")))
incidence
LDEsysMat(c(1.2, 0.3, 0.4), incidence)




library(pscl)


### Name: vuong
### Title: Vuong's non-nested hypothesis test
### Aliases: vuong
### Keywords: models

### ** Examples

data("bioChemists")
## compare Poisson GLM and ZIP
glm1 <- glm(art ~ ., data = bioChemists, family = poisson)
zip <- zeroinfl(art ~ . | ., data = bioChemists, EM = TRUE)
vuong(glm1, zip)

## Not run: 
##D ## compare negbin with zero-inflated negbin
##D nb1 <- MASS::glm.nb(art ~ ., data=bioChemists)
##D zinb <- zeroinfl(art ~ . | ., data = bioChemists, dist = "negbin", EM = TRUE)
##D vuong(nb1, zinb)
## End(Not run)




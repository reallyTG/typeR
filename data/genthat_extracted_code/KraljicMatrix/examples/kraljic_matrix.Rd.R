library(KraljicMatrix)


### Name: kraljic_matrix
### Title: Kraljic matrix plotting function
### Aliases: kraljic_matrix

### ** Examples


# Given the following \code{x} and \code{y} attribute values we can plot each
# product or service in the purchasing matrix:

# to add a new variable while preserving existing data
library(dplyr)

psc2 <- psc %>%
  mutate(x_SAVF_score = SAVF_score(x_attribute, 1, 5, .653),
         y_SAVF_score = SAVF_score(y_attribute, 1, 10, .7))

kraljic_matrix(psc2, x_SAVF_score, y_SAVF_score)





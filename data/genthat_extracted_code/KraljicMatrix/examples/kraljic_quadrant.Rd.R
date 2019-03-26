library(KraljicMatrix)


### Name: kraljic_quadrant
### Title: Kraljic quadrant assignment function
### Aliases: kraljic_quadrant

### ** Examples


# Given the following \code{x} and \code{y} attribute values  we can determine
# which quadrant each product or service falls in:

# to add a new variable while preserving existing data
library(dplyr)

psc2 <- psc %>%
  mutate(x_SAVF_score = SAVF_score(x_attribute, 1, 5, .653),
         y_SAVF_score = SAVF_score(y_attribute, 1, 10, .7))

psc2 %>%
  mutate(quadrant = kraljic_quadrant(x_SAVF_score, y_SAVF_score))





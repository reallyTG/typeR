library(polmineR)


### Name: dispersion
### Title: Dispersion of a query or multiple queries
### Aliases: dispersion dispersion,partition-method
###   dispersion,character-method dispersion,hits-method

### ** Examples

use("polmineR")
test <- partition("GERMAPARLMINI", date = ".*", p_attribute = NULL, regex = TRUE)
integration <- dispersion(
  test, query = "Integration",
  p_attribute = "word", s_attribute = "date"
)
integration <- dispersion(test, "Integration", s_attribute = c("date", "party"))
integration <- dispersion(test, '"Integration.*"', s_attribute = "date", cqp = TRUE)




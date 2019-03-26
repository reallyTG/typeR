library(embed)


### Name: step_lencode_glm
### Title: Supervised Factor Conversions into Linear Functions using
###   Likelihood Encodings
### Aliases: step_lencode_glm tidy.step_lencode_glm
### Keywords: datagen

### ** Examples

library(recipes)
library(dplyr)

data(okc)

glm_est <- recipe(Class ~ age + location, data = okc) %>%
  step_lencode_glm(location, outcome = vars(Class))

# See https://tidymodels.github.io/embed/ for examples




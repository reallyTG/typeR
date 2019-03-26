library(embed)


### Name: step_lencode_bayes
### Title: Supervised Factor Conversions into Linear Functions using
###   Bayesian Likelihood Encodings
### Aliases: step_lencode_bayes tidy.step_lencode_bayes
### Keywords: datagen

### ** Examples

library(recipes)
library(dplyr)

data(okc)

reencoded <- recipe(Class ~ age + location, data = okc) %>%
  step_lencode_bayes(location, outcome = vars(Class))

# See https://tidymodels.github.io/embed/ for examples




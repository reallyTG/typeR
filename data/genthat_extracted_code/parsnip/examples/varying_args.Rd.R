library(parsnip)


### Name: varying_args
### Title: Determine varying arguments
### Aliases: varying_args varying_args.model_spec varying_args.recipe
###   varying_args.step

### ** Examples

library(dplyr)
library(rlang)

rand_forest() %>% varying_args(id = "plain")

rand_forest(mtry = varying()) %>% varying_args(id = "one arg")

rand_forest() %>%
  set_engine("ranger", sample.fraction = varying()) %>%
  varying_args(id = "only eng_args")

rand_forest() %>%
  set_engine(
    "ranger",
    strata = expr(Class),
     sampsize = c(varying(), varying())
  ) %>%
  varying_args(id = "add an expr")

 rand_forest() %>%
   set_engine("ranger", classwt = c(class1 = 1, class2 = varying())) %>%
   varying_args(id = "list of values")





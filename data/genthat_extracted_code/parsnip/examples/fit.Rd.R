library(parsnip)


### Name: fit.model_spec
### Title: Fit a Model Specification to a Dataset
### Aliases: fit.model_spec fit_xy.model_spec

### ** Examples

# Although `glm` only has a formula interface, different
# methods for specifying the model can be used

library(dplyr)
data("lending_club")

lr_mod <- logistic_reg()

lr_mod <- logistic_reg()

using_formula <-
  lr_mod %>%
  set_engine("glm") %>%
  fit(Class ~ funded_amnt + int_rate, data = lending_club)

using_xy <-
  lr_mod %>%
   set_engine("glm") %>%
  fit_xy(x = lending_club[, c("funded_amnt", "int_rate")],
         y = lending_club$Class)

using_formula
using_xy




library(embed)


### Name: step_embed
### Title: Encoding Factors into Multiple Columns
### Aliases: step_embed tidy.step_embed embed_control
### Keywords: datagen

### ** Examples

data(okc)

rec <- recipe(Class ~ age + location, data = okc) %>%
  step_embed(location, outcome = vars(Class),
             options = embed_control(epochs = 10))

# See https://tidymodels.github.io/embed/ for examples




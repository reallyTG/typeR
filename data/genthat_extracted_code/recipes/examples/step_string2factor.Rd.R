library(recipes)


### Name: step_string2factor
### Title: Convert Strings to Factors
### Aliases: step_string2factor tidy.step_string2factor
### Keywords: datagen

### ** Examples

data(okc)

rec <- recipe(~ diet + location, data = okc)

make_factor <- rec %>%
  step_string2factor(diet)
make_factor <- prep(make_factor,
                    training = okc,
                    strings_as_factors = FALSE,
                    retain = TRUE)

# note that `diet` is a factor
juice(make_factor) %>% head
okc %>% head
tidy(make_factor, number = 1)




library(recipes)


### Name: step_regex
### Title: Create Dummy Variables using Regular Expressions
### Aliases: step_regex tidy.step_regex
### Keywords: datagen

### ** Examples

data(covers)

rec <- recipe(~ description, covers) %>%
  step_regex(description, pattern = "(rock|stony)", result = "rocks") %>%
  step_regex(description, pattern = "ratake families")

rec2 <- prep(rec, training = covers)
rec2

with_dummies <- bake(rec2, new_data = covers)
with_dummies
tidy(rec, number = 1)
tidy(rec2, number = 1)




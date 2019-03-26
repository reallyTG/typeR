library(recipes)


### Name: step_count
### Title: Create Counts of Patterns using Regular Expressions
### Aliases: step_count tidy.step_count
### Keywords: datagen

### ** Examples

data(covers)

rec <- recipe(~ description, covers) %>%
  step_count(description, pattern = "(rock|stony)", result = "rocks") %>%
  step_count(description, pattern = "famil", normalize = TRUE)

rec2 <- prep(rec, training = covers)
rec2

count_values <- bake(rec2, new_data = covers)
count_values

tidy(rec, number = 1)
tidy(rec2, number = 1)




library(recipes)


### Name: step_bin2factor
### Title: Create a Factors from A Dummy Variable
### Aliases: step_bin2factor tidy.step_bin2factor
### Keywords: datagen

### ** Examples

data(covers)

rec <- recipe(~ description, covers) %>%
 step_regex(description, pattern = "(rock|stony)", result = "rocks") %>%
 step_regex(description, pattern = "(rock|stony)", result = "more_rocks") %>%
 step_bin2factor(rocks)

tidy(rec, number = 3)

rec <- prep(rec, training = covers)
results <- bake(rec, new_data = covers)

table(results$rocks, results$more_rocks)

tidy(rec, number = 3)




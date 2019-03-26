library(recipes)


### Name: step_ordinalscore
### Title: Convert Ordinal Factors to Numeric Scores
### Aliases: step_ordinalscore tidy.step_ordinalscore
### Keywords: datagen

### ** Examples

fail_lvls <- c("meh", "annoying", "really_bad")

ord_data <-
  data.frame(item = c("paperclip", "twitter", "airbag"),
             fail_severity = factor(fail_lvls,
                                    levels = fail_lvls,
                                    ordered = TRUE))

model.matrix(~fail_severity, data = ord_data)

linear_values <- recipe(~ item + fail_severity, data = ord_data) %>%
  step_dummy(item) %>%
  step_ordinalscore(fail_severity)

linear_values <- prep(linear_values, training = ord_data, retain = TRUE)

juice(linear_values, everything())

custom <- function(x) {
  new_values <- c(1, 3, 7)
  new_values[as.numeric(x)]
}

nonlin_scores <- recipe(~ item + fail_severity, data = ord_data) %>%
  step_dummy(item) %>%
  step_ordinalscore(fail_severity, convert = custom)

tidy(nonlin_scores, number = 2)

nonlin_scores <- prep(nonlin_scores, training = ord_data, retain = TRUE)

juice(nonlin_scores, everything())

tidy(nonlin_scores, number = 2)




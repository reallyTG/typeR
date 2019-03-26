library(textrecipes)


### Name: step_tokenize
### Title: Tokenization of character variables
### Aliases: step_tokenize tidy.step_tokenize

### ** Examples

library(recipes)

data(okc_text)

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) 
  
okc_obj <- okc_rec %>%
  prep(training = okc_text, retain = TRUE)

juice(okc_obj, essay0) %>%
  slice(1:2)

juice(okc_obj) %>%
  slice(2) %>%
  pull(essay0)
  
tidy(okc_rec, number = 1)
tidy(okc_obj, number = 1)

okc_obj_chars <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0, token = "characters") %>%
  prep(training = okc_text, retain = TRUE)

juice(okc_obj_chars) %>%
  slice(2) %>%
  pull(essay0)




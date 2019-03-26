library(textrecipes)


### Name: step_untokenize
### Title: Untokenization of list-column variables
### Aliases: step_untokenize tidy.step_untokenize

### ** Examples

library(recipes)

data(okc_text)

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_untokenize(essay0) 
  
okc_obj <- okc_rec %>%
  prep(training = okc_text, retain = TRUE)

juice(okc_obj, essay0) %>% 
  slice(1:2)

juice(okc_obj) %>% 
  slice(2) %>% 
  pull(essay0) 
  
tidy(okc_rec, number = 2)
tidy(okc_obj, number = 2)




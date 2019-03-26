library(textrecipes)


### Name: step_tf
### Title: Term frequency of tokens
### Aliases: step_tf tidy.step_tf

### ** Examples

## No test: 
library(recipes)

data(okc_text)

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_tf(essay0)
  
okc_obj <- okc_rec %>%
  prep(training = okc_text, retain = TRUE)
  
bake(okc_obj, okc_text)

tidy(okc_rec, number = 2)
tidy(okc_obj, number = 2)
## End(No test)




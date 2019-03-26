library(textrecipes)


### Name: step_texthash
### Title: Term frequency of tokens
### Aliases: step_texthash tidy.step_texthash

### ** Examples

library(recipes)

data(okc_text)

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_tokenfilter(essay0, max_tokens = 10) %>%
  step_texthash(essay0)
  
okc_obj <- okc_rec %>%
  prep(training = okc_text, retain = TRUE)
  
bake(okc_obj, okc_text)

tidy(okc_rec, number = 2)
tidy(okc_obj, number = 2)




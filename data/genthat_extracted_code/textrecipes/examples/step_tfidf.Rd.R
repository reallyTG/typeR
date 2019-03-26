library(textrecipes)


### Name: step_tfidf
### Title: Term frequency-inverse document frequency of tokens
### Aliases: step_tfidf tidy.step_tfidf

### ** Examples

## No test: 
library(recipes)

data(okc_text)

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_tfidf(essay0)
  
okc_obj <- okc_rec %>%
  prep(training = okc_text, retain = TRUE)
  
bake(okc_obj, okc_text)

tidy(okc_rec, number = 2)
tidy(okc_obj, number = 2)
## End(No test)




library(textrecipes)


### Name: step_stopwords
### Title: Filtering of stopwords from a list-column variable
### Aliases: step_stopwords tidy.step_stopwords

### ** Examples

library(recipes)

data(okc_text)

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_stopwords(essay0) 
  
okc_obj <- okc_rec %>%
  prep(training = okc_text, retain = TRUE)

juice(okc_obj, essay0) %>% 
  slice(1:2)

juice(okc_obj) %>% 
  slice(2) %>% 
  pull(essay0) 
  
tidy(okc_rec, number = 2)
tidy(okc_obj, number = 2)
# With a custom stopwords list

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_stopwords(essay0, custom_stopword_source = c("twice", "upon"))
okc_obj <- okc_rec %>%
  prep(traimomg = okc_text, retain = TRUE)
  
juice(okc_obj) %>%
  slice(2) %>%
  pull(essay0) 




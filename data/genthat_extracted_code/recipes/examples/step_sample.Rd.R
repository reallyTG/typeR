library(recipes)


### Name: step_sample
### Title: Sample rows using dplyr
### Aliases: step_sample tidy.step_sample
### Keywords: datagen

### ** Examples


# Uses `sample_n`
recipe( ~ ., data = iris) %>%
  step_sample(size = 1) %>%
  prep(training = iris, retain = TRUE) %>%
  juice() %>% 
  nrow()

# Uses `sample_frac`
recipe( ~ ., data = iris) %>%
  step_sample(size = 0.9999) %>%
  prep(training = iris, retain = TRUE) %>%
  juice() %>% 
  nrow()
  
# Uses `sample_n` and returns _at maximum_ 120 samples. 
smaller_iris <- 
  recipe( ~ ., data = iris) %>%
  step_sample() %>%
  prep(training = iris %>% slice(1:120), retain = TRUE) 
  
juice(smaller_iris) %>% nrow()
bake(smaller_iris, iris %>% slice(121:150)) %>% nrow()




library(recipes)


### Name: step_dummy
### Title: Dummy Variables Creation
### Aliases: step_dummy tidy.step_dummy
### Keywords: datagen

### ** Examples

data(okc)
okc <- okc[complete.cases(okc),]

rec <- recipe(~ diet + age + height, data = okc)

dummies <- rec %>% step_dummy(diet)
dummies <- prep(dummies, training = okc)

dummy_data <- bake(dummies, new_data = okc)

unique(okc$diet)
grep("^diet", names(dummy_data), value = TRUE)

# Obtain the full set of dummy variables using `one_hot` option
rec %>%
  step_dummy(diet, one_hot = TRUE) %>%
  prep(training = okc, retain = TRUE) %>%
  juice(starts_with("diet")) %>%
  names() %>%
  length()

length(unique(okc$diet))

# Without one_hot
length(grep("^diet", names(dummy_data), value = TRUE))


tidy(dummies, number = 1)




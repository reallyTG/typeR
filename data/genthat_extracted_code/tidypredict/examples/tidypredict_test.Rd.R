library(tidypredict)


### Name: tidypredict_test
### Title: Tests base predict function against tidypredict
### Aliases: tidypredict_test

### ** Examples


model <- lm(mpg ~ wt + cyl * disp, offset = am, data = mtcars)
tidypredict_test(model)





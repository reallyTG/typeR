library(tidypredict)


### Name: tidypredict_interval
### Title: Returns a Tidy Eval formula to calculate prediction interval
### Aliases: tidypredict_interval

### ** Examples


model <- lm(mpg ~ wt + cyl * disp, offset = am, data = mtcars)
tidypredict_interval(model)





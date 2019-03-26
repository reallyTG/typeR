library(tidypredict)


### Name: tidypredict_fit
### Title: Returns a Tidy Eval formula to calculate fitted values
### Aliases: tidypredict_fit

### ** Examples


model <- lm(mpg ~ wt + cyl * disp, offset = am, data = mtcars)
tidypredict_fit(model)





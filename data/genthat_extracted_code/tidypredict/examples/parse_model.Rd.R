library(tidypredict)


### Name: parse_model
### Title: Converts an R model object into a table
### Aliases: parse_model

### ** Examples

library(dplyr)
df <- mutate(mtcars, cyl = paste0("cyl", cyl))
model <- lm(mpg ~ wt + cyl * disp, offset = am, data = df)
parse_model(model)





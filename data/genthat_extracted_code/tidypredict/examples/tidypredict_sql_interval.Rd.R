library(tidypredict)


### Name: tidypredict_sql_interval
### Title: Returns a SQL query with formula to calculate predicted interval
### Aliases: tidypredict_sql_interval
### Keywords: internal

### ** Examples

library(dbplyr)

model <- lm(mpg ~ wt + am + cyl, data = mtcars)
tidypredict_sql_interval(model, simulate_dbi())





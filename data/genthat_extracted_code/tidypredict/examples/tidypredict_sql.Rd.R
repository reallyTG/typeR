library(tidypredict)


### Name: tidypredict_sql
### Title: Returns a SQL query with formula to calculate fitted values
### Aliases: tidypredict_sql
### Keywords: internal

### ** Examples

library(dbplyr)

model <- lm(mpg ~ wt + am + cyl, data = mtcars)
tidypredict_sql(model, simulate_dbi())





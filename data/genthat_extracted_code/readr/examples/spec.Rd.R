library(readr)


### Name: cols_condense
### Title: Examine the column specifications for a data frame
### Aliases: cols_condense spec

### ** Examples

df <- read_csv(readr_example("mtcars.csv"))
s <- spec(df)
s

cols_condense(s)




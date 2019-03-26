library(tidybayes)


### Name: combine_chains
### Title: Combine the chain and iteration columns of tidy data frames of
###   draws
### Aliases: combine_chains
### Keywords: manip

### ** Examples


library(magrittr)
library(coda)

data(line, package = "coda")

# The `line` posterior has two chains with 200 iterations each:
line %>%
  tidy_draws() %>%
  summary()

# combine_chains combines the chain and iteration column into the .draw column.
line %>%
  tidy_draws() %>%
  combine_chains() %>%
  summary()





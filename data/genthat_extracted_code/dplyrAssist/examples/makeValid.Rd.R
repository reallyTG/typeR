library(dplyrAssist)


### Name: makeValid
### Title: Make valid R code
### Aliases: makeValid

### ** Examples

require(tidyverse)
temp <- "iris %>%
group_by(Species) %>%
summarize_all(mean)

table1"
makeValid(temp)




library(dplyrAssist)


### Name: makeValidCode
### Title: Make valid R code
### Aliases: makeValidCode

### ** Examples

require(tidyverse)
temp <- "iris %>%
group_by(Species) %>%
summarize_all(mean)

table1"
makeValidCode(temp)




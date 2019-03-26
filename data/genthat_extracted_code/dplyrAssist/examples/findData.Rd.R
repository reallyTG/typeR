library(dplyrAssist)


### Name: findData
### Title: Detect the valid data
### Aliases: findData

### ** Examples

require(tidyverse)
temp <- "iris %>%
group_by(Species) %>%
summarize_all(mean)

table1"
findData(temp)




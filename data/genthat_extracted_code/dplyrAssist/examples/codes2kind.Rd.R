library(dplyrAssist)


### Name: codes2kind
### Title: Differentiate the R code
### Aliases: codes2kind

### ** Examples

require(tidyverse)
temp <-c("iris %>% group_by(Species) %>% summarize_all(mean)","table1")
codes2kind(temp)




library(coalitions)


### Name: prettify_strings
### Title: Replace/prettify matching words/terms in one vector by another
### Aliases: prettify_strings prettify_de prettify_en
### Keywords: internal

### ** Examples

library(coalitions)
library(dplyr) 
# look at sample German federal election polls
surveys <- surveys_sample %>% tidyr::unnest() %>% group_by(pollster) %>% slice(1)
# prettify the polling agency names
prettify_strings(surveys$pollster)
prettify_en(surveys$pollster)
prettify_de(surveys$pollster)




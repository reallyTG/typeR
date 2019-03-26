library(coalitions)


### Name: pool_surveys
### Title: Obtain pooled survey during specified period
### Aliases: pool_surveys

### ** Examples

library(coalitions)
library(dplyr)
latest <- get_latest(surveys_sample)
pool_surveys(surveys_sample, last_date=as.Date("2017-09-02"))




library(coalitions)


### Name: get_surveys
### Title: Scrape surveys from all pollsters
### Aliases: get_surveys get_surveys_by get_surveys_nds get_latest

### ** Examples

library(coalitions)
# scrape data for the German federal election
# get_surveys()
library(coalitions)
### Scrape the newest poll for the German federal election
# Possibility 1: Calling get_latest without arguments scrapes surveys from the web
# Possibility 2: Use get_latest() on an already scraped dataset
surveys <- get_latest(surveys_sample)




library(eechidna)


### Name: launch_app
### Title: Shiny app for exploring census and electorate data
### Aliases: launch_app

### ** Examples

## Not run: 
##D library(shiny)
##D library(plotly)
##D library(tidyverse)
##D # for comparing labor/liberal
##D launch_app(
##D   election_year = 2016,
##D   age = c("Age20_24", "Age25_34", "Age55_64"),
##D   religion = c("Christianity", "Catholic", "NoReligion"),
##D   other = c("AusCitizen", "MedianPersonalIncome", "Unemployed")
##D )
##D 
##D # for inspecting highly contested areas
##D launch_app(
##D   election_year = 2016,
##D   age = c("Age25_34", "Age35_44", "Age55_64"),
##D   religion = c("Christianity", "Catholic", "NoReligion"),
##D   other = c("Owned", "Indigenous", "AusCitizen")
##D )
##D 
##D launch_app()
##D 
## End(Not run)




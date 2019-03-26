library(sms)


### Name: random_panel_selection
### Title: random_panel_selection
### Aliases: random_panel_selection

### ** Examples

library(sms)
data(survey) #load the data
data(census)
    
some.individuals=random_panel_selection(survey,4)
print(some.individuals)     # Print the selection of individuals




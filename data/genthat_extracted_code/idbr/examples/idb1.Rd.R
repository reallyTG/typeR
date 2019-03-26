library(idbr)


### Name: idb1
### Title: Retrieve data from the single-year-of-age IDB dataset.
### Aliases: idb1

### ** Examples

## Not run: 
##D 
##D # Projected population pyramid of China in 2050 with idbr and plotly
##D 
##D library(idbr)
##D library(plotly)
##D library(dplyr)
##D 
##D idb_api_key('Your API key goes here')
##D 
##D male <- idb1('CH', 2050, sex = 'male') %>%
##D   mutate(POP = POP * -1,
##D          SEX = 'Male')
##D 
##D female <- idb1('CH', 2050, sex = 'female') %>%
##D    mutate(SEX = 'Female')
##D china <- rbind(male, female) %>%
##D    mutate(abs_pop = abs(POP))
##D plot_ly(china, x = POP, y = AGE, color = SEX, type = 'bar', orientation = 'h',
##D         hoverinfo = 'y+text+name', text = abs_pop, colors = c('red', 'gold')) %>%
##D   layout(bargap = 0.1, barmode = 'overlay',
##D          xaxis = list(tickmode = 'array', tickvals = c(-10000000, -5000000, 0, 5000000, 10000000),
##D                      ticktext = c('10M', '5M', '0', '5M', '10M')),
##D          title = 'Projected population structure of China, 2050')
##D 
## End(Not run)




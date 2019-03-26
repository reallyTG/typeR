library(idbr)


### Name: idb5
### Title: Retrieve data from the five-year-age-group IDB dataset.
### Aliases: idb5

### ** Examples

## Not run: 
##D 
##D # World map of infant mortality rates by country for 2016 with plotly
##D 
##D library(idbr)
##D library(plotly)
##D library(viridis)
##D 
##D idb_api_key('Your API key goes here')
##D 
##D df <- idb5(country = 'all', year = 2016, variable = 'IMR', country_name = TRUE)
##D 
##D plot_ly(df, z = IMR, text = NAME, locations = NAME, locationmode = 'country names',
##D         type = 'choropleth', colors = viridis(99), hoverinfo = 'text+z') %>%
##D   layout(title = 'Infant mortality rate (per 1000 live births), 2016',
##D          geo = list(projection = list(type = 'robinson')))
##D 
##D 
## End(Not run)




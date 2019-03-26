library(dygraphs)


### Name: dyRangeSelector
### Title: dygraph interactive range selection and zooming
### Aliases: dyRangeSelector

### ** Examples

library(dygraphs)

dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector()   
 
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))   
    
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(height = 20, strokeColor = "")     





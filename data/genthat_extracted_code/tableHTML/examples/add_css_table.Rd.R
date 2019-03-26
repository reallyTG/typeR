library(tableHTML)


### Name: add_css_table
### Title: Add css to the whole tableHTML
### Aliases: add_css_table

### ** Examples

tableHTML(mtcars) %>% 
  add_css_table(css = list('background-color', 'lightgray')) 
  
tableHTML(mtcars) %>% 
  add_css_table(css = list('background-color', 'lightgray')) %>%
  add_css_table(css = list('background-color', 'lightblue')) 
  
tableHTML(mtcars) %>% 
  add_css_table(css = list('background-color', 'lightgray')) %>%
  add_css_table(css = list('text-align', 'center'))
  





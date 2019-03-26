library(tableHTML)


### Name: add_css_tbody
### Title: Add css to the tbody tag
### Aliases: add_css_tbody

### ** Examples

tableHTML(mtcars) %>% 
  add_css_tbody(css = list('background-color', 'lightgray')) 
  
tableHTML(mtcars) %>% 
  add_css_tbody(css = list('background-color', 'lightgray')) %>%
  add_css_tbody(css = list('background-color', 'lightblue')) 
  
tableHTML(mtcars) %>% 
  add_css_tbody(css = list('background-color', 'lightgray')) %>%
  add_css_tbody(css = list('text-align', 'center'))
  





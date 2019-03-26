library(tableHTML)


### Name: add_css_thead
### Title: Add css to the thead tag
### Aliases: add_css_thead

### ** Examples

tableHTML(mtcars) %>% 
  add_css_thead(css = list('background-color', 'lightgray')) 
  
tableHTML(mtcars) %>% 
  add_css_thead(css = list('background-color', 'lightgray')) %>%
  add_css_thead(css = list('background-color', 'lightblue')) 
  
tableHTML(mtcars) %>% 
  add_css_thead(css = list('background-color', 'lightgray')) %>%
  add_css_thead(css = list('text-align', 'center'))
  





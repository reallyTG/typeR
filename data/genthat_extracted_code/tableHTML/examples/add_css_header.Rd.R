library(tableHTML)


### Name: add_css_header
### Title: Add css to tableHTML's headers
### Aliases: add_css_header

### ** Examples

tableHTML(mtcars) %>% 
  add_css_header(css = list(c('background-color', 'border'), c('lightgray', '3px solid green')),
                 headers = 2) 

tableHTML(mtcars) %>% 
  add_css_header(css = list(c('background-color', 'border'), c('lightgray', '3px solid green')), 
                 headers = c(1, 4))




library(tableHTML)


### Name: add_css_second_header
### Title: Add css to tableHTML's second headers
### Aliases: add_css_second_header

### ** Examples

tableHTML(mtcars, second_headers = list(c(3, 4, 5), c('col1', 'col2', 'col3'))) %>% 
  add_css_second_header(css = list(c('background-color', 'border'), 
                                   c('lightgray', '3px solid green')),
                        second_headers = c(1, 3))  





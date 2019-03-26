library(tableHTML)


### Name: add_css_row
### Title: Add css to tableHTML's rows
### Aliases: add_css_row

### ** Examples

tableHTML(mtcars) %>% 
  add_css_row(css = list(c('background-color', 'border'), c('lightgray', '3px solid green'))) 

tableHTML(mtcars) %>% 
  add_css_row(css = list(c('background-color', 'border'), c('lightgray', '3px solid green')), 
              rows = 1:33)
        




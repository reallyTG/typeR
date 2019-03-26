library(tableHTML)


### Name: add_css_column
### Title: Add css to tableHTML's columns
### Aliases: add_css_column

### ** Examples

tableHTML(mtcars) %>% 
  add_css_column(css = list(c('background-color', 'border'), c('lightgray', '3px solid green')),
                 columns = 'mpg') 

tableHTML(mtcars) %>% 
  add_css_column(css = list(c('background-color', 'border'), c('lightgray', '3px solid green')), 
                 columns = c('mpg', 'disp', 'rownames'))
                 
tableHTML(mtcars, 
          rownames = FALSE, 
          widths = c(120, rep(50, 11)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3'))) %>%
  add_css_column(css = list('background-color', 'lightgray'), columns = 'row_groups') %>%
  add_css_header(css = list('background-color', 'lightgray'), headers = 1)
  
tableHTML(mtcars, 
          rownames = TRUE, 
          widths = c(140, rep(50, 12)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          second_headers = list(c(3, 4), c('col1', 'col2'))) %>% 
  add_css_column(list('background-color', 'green'), -1) %>%
  add_css_column(list('background-color', 'red'), c(0, 1))





library(tableHTML)


### Name: add_css_footer
### Title: Add css to tableHTML's footer
### Aliases: add_css_footer

### ** Examples

tableHTML(mtcars, footer = 'This is a footer') %>% 
  add_css_footer(css = list(c('color', 'font-size'), c('blue', '50px'))) 

tableHTML(mtcars, footer = 'This is a footer') %>% 
  add_css_footer(css = list(c('color', 'font-size'), c('blue', '50px'))) %>%
  add_css_footer(css = list('background-color', 'green'))





library(tableHTML)


### Name: add_css_caption
### Title: Add css to tableHTML's caption
### Aliases: add_css_caption

### ** Examples

tableHTML(mtcars, caption = 'This is a caption') %>% 
  add_css_caption(css = list(c('color', 'font-size'), c('blue', '50px'))) 

tableHTML(mtcars, caption = 'This is a caption') %>% 
  add_css_caption(css = list(c('color', 'font-size'), c('blue', '50px'))) %>%
  add_css_caption(css = list('background-color', 'green'))





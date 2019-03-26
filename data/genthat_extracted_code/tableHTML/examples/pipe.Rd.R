library(tableHTML)


### Name: %>%
### Title: Pipe css
### Aliases: %>%

### ** Examples

# Instead of
  add_css_row(tableHTML(mtcars),
              css = list(c('background-color', 'border'), c('lightgray', '3px solid green')))
# you can write
  mtcars %>%
    tableHTML() %>% 
    add_css_row(css = list(c('background-color', 'border'), c('lightgray', '3px solid green'))) 




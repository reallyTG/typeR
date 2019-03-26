library(tableHTML)


### Name: replace_html
### Title: Replaces a tableHTML string with another
### Aliases: replace_html

### ** Examples

a <- mtcars %>% 
  tableHTML() %>% 
  add_css_row(css = list('background-color', 'lightblue'), rows = 1)
    
a %>% 
  replace_html('lightblue', 'green')






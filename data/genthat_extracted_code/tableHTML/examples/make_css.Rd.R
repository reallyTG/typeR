library(tableHTML)


### Name: make_css
### Title: Create a css file or string
### Aliases: make_css

### ** Examples

make_css(list('table', c('text-align', 'font-size'), c('center', '20px')),
         list('th', c('background-color', 'height'), c('lightgreen', '30px')))
         
make_css(list(c('table', 'td'), c('text-align', 'font-size'), c('center', '20px')),
         list('th', c('background-color', 'height'), c('lightgreen', '30px')))         

make_css(list('tr:hover', c('text-align', 'font-size'), c('center', '20px')),
         list('th', c('background-color', 'height'), c('lightgreen', '30px')))    





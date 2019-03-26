library(tableHTML)


### Name: tableHTML
### Title: Create an easily css-ible HTML table
### Aliases: print.tableHTML tableHTML

### ** Examples

tableHTML(mtcars)
tableHTML(mtcars, rownames = FALSE)
tableHTML(mtcars, class = 'table1')
tableHTML(mtcars, second_headers = list(c(3, 4, 5), c('col1', 'col2', 'col3')))
tableHTML(mtcars,
          widths = c(rep(50, 6), rep(100, 6)),
          second_headers = list(c(3, 4, 5), c('col1', 'col2', 'col3')))
tableHTML(mtcars, caption = 'This is a caption', footer = 'This is a footer')
tableHTML(mtcars,
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          widths = c(200, rep(50, 5), rep(100, 6)),
          rownames = FALSE)
tableHTML(mtcars,
          rownames = FALSE,
          widths = c(140, rep(50, 11)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          second_headers = list(c(3, 4, 5), c('col1', 'col2', 'col3')))
tableHTML(mtcars,
          rownames = FALSE,
          widths = c(140, rep(50, 11)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          second_headers = list(c(3, 4), c('col1', 'col2')),
          theme = 'scientific')
tableHTML(mtcars, theme = 'rshiny-blue', widths = c(140, rep(50, 11)))
tableHTML(mtcars, collapse = 'separate_shiny', spacing = '5px')
tableHTML(mtcars, collapse = 'separate', spacing = '5px 2px')





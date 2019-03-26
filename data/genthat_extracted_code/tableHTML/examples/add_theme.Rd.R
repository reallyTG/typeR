library(tableHTML)


### Name: add_theme
### Title: Add a theme to the tableHTML
### Aliases: add_theme

### ** Examples

tableHTML(mtcars,
          rownames = FALSE,
          widths = c(140, rep(50, 11)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          second_headers = list(c(3, 4), c('col1', 'col2'))) %>%
  add_theme('scientific')

tableHTML(mtcars, widths = c(140, rep(50, 11))) %>%
  add_theme ('rshiny-blue')

mtcars %>%
  tableHTML(widths = c(150, rep(50, 11)),
            rownames = TRUE) %>%
  add_theme('colorize')

generate_df <- function(){
  df <- data.frame(Month = month.abb,
                   x1 = sample(1:100, 12),
                   x2 = sample(1:100, 12),
                   x3 = sample(1:100, 12),
                   stringsAsFactors = FALSE)
  df[nrow(df) + 1, ] <- c('Total', sum(df$x1), sum(df$x2), sum(df$x3))
  return(df)
}
df_1 <- generate_df()
df_2 <- generate_df()

rbind(df_1, df_2) %>%
  tableHTML(widths = rep(50, 4), rownames = FALSE) %>%
  add_theme('colorize', total_rows = c(13, 26),
            color = c('steelblue', 'green3'), id_column = TRUE)




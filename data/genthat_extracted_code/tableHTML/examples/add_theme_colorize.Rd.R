library(tableHTML)


### Name: add_theme_colorize
### Title: Add a theme to a tableHTML with a total row.
### Aliases: add_theme_colorize

### ** Examples

# no total rows
mtcars %>%
 tableHTML(widths = c(140, rep(50, 11))) %>%
 add_theme_colorize()

# one total row
x1 <- sample(1:100, 12)
x2 <- sample(1:100, 12)
x3 <- sample(1:100, 12)

df <- data.frame(Month = month.abb, x1, x2, x3,
                 stringsAsFactors = FALSE)

df[nrow(df) + 1, ] <- c('Total', sum(x1), sum(x2), sum(x3))

df %>%
  tableHTML(widths = rep(50, 4), rownames = FALSE) %>%
  add_theme_colorize(total_rows = nrow(df),
                     color = 'darkred')


# multiple subtotal rows
df_q <- rbind(
  df[1:3, ],
  c('Sum1', sum(x1[1:3]), sum(x2[1:3]), sum(x3[1:3])),
  df[4:6, ],
  c('Sum2', sum(x1[4:6]), sum(x2[4:6]), sum(x3[4:6])),
  df[7:9, ],
  c('Sum3', sum(x1[7:9]), sum(x2[7:9]), sum(x3[7:9])),
  df[10:12, ],
  c('Sum4', sum(x1[10:12]), sum(x2[10:12]), sum(x3[10:12])))

df_q %>%
  tableHTML(widths = rep(50, 5),
            rownames = FALSE,
            row_groups = list(c(4, 4, 4, 4),
                              c('Q1', 'Q2', 'Q3', 'Q4'))) %>%
  add_theme_colorize(color = '#009999',
                   total_rows = c(4, 8, 12, 16))

# Two colors and an id_column
df_q %>%
  tableHTML(widths = rep(50, 5),
            rownames = FALSE,
            row_groups = list(c(4, 4, 4, 4),
                              c('Q1', 'Q2', 'Q3', 'Q4'))) %>%
  add_theme_colorize(color = c('pink3', 'yellow2'),
                   total_rows = c(4, 8, 12, 16), id_column = TRUE)





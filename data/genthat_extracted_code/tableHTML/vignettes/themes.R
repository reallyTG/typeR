## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----load_package--------------------------------------------------------
library(tableHTML)

## ----theme-scientific----------------------------------------------------
tableHTML(mtcars, widths = c(140, rep(50, 11))) %>%
 add_theme('scientific')

## ----scientific_2--------------------------------------------------------
tableHTML(mtcars,
          rownames = FALSE,
          widths = c(140, rep(50, 11)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          second_headers = list(c(3, 4, 5), c('col1', 'col2', 'col3'))) %>%
  add_theme('scientific')

## ----theme-rshiny-blue---------------------------------------------------
tableHTML(mtcars, widths = c(140, rep(50, 11))) %>%
 add_theme('rshiny-blue')

## ----theme_rshiny_blue_2-------------------------------------------------
tableHTML(mtcars,
          rownames = FALSE,
          widths = c(140, rep(50, 11)),
          row_groups = list(c(10, 10, 12), c('Group 1', 'Group 2', 'Group 3')),
          second_headers = list(c(3, 4, 5), c('col1', 'col2', 'col3'))) %>%
  add_theme('rshiny-blue')

## ----totals_1------------------------------------------------------------
df <- mtcars[, 1:6]
df %>%
  tableHTML(widths = c(150, rep(70, ncol(df))), rownames = TRUE) %>%
  add_theme('colorize')

## ----totals_2------------------------------------------------------------
df <- mtcars[, 1:6]
df %>%
  tableHTML(widths = c(150, rep(70, ncol(df))), rownames = TRUE) %>%
  add_theme('colorize', color = 'darkgreen')

## ----totals_3------------------------------------------------------------
df <- mtcars[, 1:6]
df['Mean', ] <- (df %>% apply(2, mean))
df %>%
  tableHTML(widths = c(150, rep(70, ncol(df))), rownames = TRUE) %>%
  add_theme('colorize', color = c('steelblue', 'red'))

## ----totals_4------------------------------------------------------------
df <- mtcars[, 1:6]
df['Mean', ] <- (df %>% apply(2, mean))
df %>%
  tableHTML(widths = c(150, rep(70, ncol(df))), rownames = TRUE) %>%
  add_theme('colorize', color = c('steelblue', 'red'), total_rows = nrow(df))

## ----total_theme_1-------------------------------------------------------
# one total row
x1 <- sample(1:100, 12)
x2 <- sample(1:100, 12)
x3 <- sample(1:100, 12)

df <- data.frame(Month = month.abb, x1, x2, x3,
                 stringsAsFactors = FALSE)

df[nrow(df) + 1, ] <- c('Total', sum(x1), sum(x2), sum(x3))

df %>%
  tableHTML(widths = rep(50, 4), rownames = FALSE) %>%
  add_theme_colorize(color = 'darkred', total_rows = nrow(df))

## ----total_theme_2-------------------------------------------------------
df_q <- rbind(
  df[1:3, ],
  c('Sum1', sum(x1[1:3]), sum(x2[1:3]), sum(x3[1:3])),
  df[4:6, ],
  c('Sum2', sum(x1[4:6]), sum(x2[4:6]), sum(x3[4:6])),
  df[7:9, ],
  c('Sum3', sum(x1[7:9]), sum(x2[7:9]), sum(x3[7:9])),
  df[10:12, ],
  c('Sum4', sum(x1[10:12]), sum(x2[10:12]), sum(x3[10:12])))

# Two colors and an id_column
df_q %>%
  tableHTML(widths = rep(50, 5),
            rownames = FALSE,
            row_groups = list(c(4, 4, 4, 4),
                              c('Q1', 'Q2', 'Q3', 'Q4'))) %>%
  add_theme_colorize(color = c('pink3', 'yellow2'),
                     total_rows = c(4, 8, 12, 16), id_column = TRUE)



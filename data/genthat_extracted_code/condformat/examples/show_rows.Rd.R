library(condformat)


### Name: show_rows
### Title: Selects the rows to be printed
### Aliases: show_rows

### ** Examples

library(condformat)
data(iris)
x <- head(iris)
condformat(x) %>% show_rows(Sepal.Length > 4.5, Species == "setosa")
# Use it programatically
expr_as_text <- 'Sepal.Length > 4.5'
expr <- rlang::parse_expr(expr_as_text)
condformat(x) %>% show_rows(!! expr)
# With multiple arguments:
expr_as_text <- c('Sepal.Length > 4.5', 'Species == "setosa"')
exprs <- lapply(expr_as_text, rlang::parse_expr)
condformat(x) %>% show_rows(!!! exprs)




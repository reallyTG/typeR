library(numform)


### Name: highlight_cells
### Title: Highlight Cells
### Aliases: highlight_cells

### ** Examples

highlight_cells(mtcars, rows = hp > 230 | qsec > 20)
highlight_cells(mtcars, rows = hp > 230, columns = 'hp')

## Not run: 
##D library(dplyr); library(tibble); library(pander)
##D mtcars %>%
##D     highlight_cells(rows = hp > 230, columns = 'hp') %>%
##D     highlight_cells(rows = qsec > 20, columns = 'qsec', left = '<b style="color:blue;">')  %>%
##D     rownames_to_column('car') %>%
##D     data.frame(stringsAsFactors = FALSE, check.names = FALSE) %>%
##D     pander::pander(split.tables = Inf, justify = alignment(.))
## End(Not run)

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse, magrittr)
##D 
##D set.seed(10)
##D data_frame(
##D     w = paste(constant_months, rep(2016:2017, each = 12))[1:20] ,
##D     x = rnorm(20, 200000, 75000)
##D ) %>%
##D     {
##D         a <- .
##D         rbind(
##D             a,
##D             a %>%
##D                 mutate(w = 'Total') %>%
##D                 group_by(w) %>%
##D                 summarize(x = sum(x))
##D         )
##D     } %>%
##D     mutate(
##D         y = f_denom(x, prefix = '$'),
##D         z = f_denom(x, mix.denom = TRUE, prefix = '$'),
##D         x = f_comma(f_dollar(x, 2))
##D     )  %>%
##D     highlight_cells(w == 'Total') %>%
##D     data.frame(stringsAsFactors = FALSE, check.names = FALSE) %>%
##D     pander::pander(split.tables = Inf, justify = alignment(.))
## End(Not run)




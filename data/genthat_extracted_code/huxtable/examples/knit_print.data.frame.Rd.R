library(huxtable)


### Name: knit_print.data.frame
### Title: Print data frames in knitr using huxtable
### Aliases: knit_print.data.frame

### ** Examples

## Not run: 
##D # in your knitr document
##D mytheme <- function (ht) {
##D   ht <- set_all_borders(ht, 0.4)
##D   ht <- set_all_border_colors(ht,
##D         "darkgreen")
##D   ht <- set_background_color(ht,
##D         evens, odds, "salmon")
##D   ht
##D }
##D 
##D options(huxtable.knit_print_df_theme
##D       = mytheme)
##D # groovy!
##D data.frame(
##D         a = 1:5,
##D         b = 1:5
##D       )
## End(Not run)




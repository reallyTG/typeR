library(sparkline)


### Name: spk_chr
### Title: Character Version of Sparklines
### Aliases: spk_chr

### ** Examples

## Not run: 
##D   #spk_chr works well with dplyr summarise
##D   
##D   library(dplyr)
##D   library(sparkline)
##D   library(formattable)
##D   
##D   mtcars %>%
##D     group_by(cyl) %>%
##D     summarise(
##D       hp = spk_chr(
##D         hp, type="box",
##D         chartRangeMin=0, chartRangeMax=max(mtcars$hp)
##D       ),
##D       mpg = spk_chr(
##D         mpg, type="box",
##D         chartRangeMin=0, chartRangeMax=max(mtcars$mpg)
##D       )
##D     ) %>%
##D     formattable() %>%
##D     formattable::as.htmlwidget() %>%
##D     spk_add_deps()
## End(Not run)




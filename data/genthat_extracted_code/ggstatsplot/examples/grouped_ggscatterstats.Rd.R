library(ggstatsplot)


### Name: grouped_ggscatterstats
### Title: Scatterplot with marginal distributions for all levels of a
###   grouping variable
### Aliases: grouped_ggscatterstats

### ** Examples


## Not run: 
##D # to ensure reproducibility
##D set.seed(123)
##D 
##D # basic function call
##D ggstatsplot::grouped_ggscatterstats(
##D   data = dplyr::filter(
##D     ggstatsplot::movies_long,
##D     genre == "Comedy" |
##D       genre == "Drama"
##D   ),
##D   x = length,
##D   y = rating,
##D   method = "lm",
##D   formula = y ~ x + I(x^3),
##D   grouping.var = genre
##D )
##D 
##D # using labeling
##D # (also show how to modify basic plot from within function call)
##D ggstatsplot::grouped_ggscatterstats(
##D   data = dplyr::filter(ggplot2::mpg, cyl != 5),
##D   x = displ,
##D   y = hwy,
##D   grouping.var = cyl,
##D   title.prefix = "Cylinder count",
##D   type = "robust",
##D   label.var = manufacturer,
##D   label.expression = hwy > 25 & displ > 2.5,
##D   xfill = NULL,
##D   ggplot.component = ggplot2::scale_y_continuous(sec.axis = ggplot2::dup_axis()),
##D   package = "yarrr",
##D   palette = "appletv",
##D   messages = FALSE
##D )
##D 
##D # labeling without expression
##D 
##D ggstatsplot::grouped_ggscatterstats(
##D   data = dplyr::filter(
##D     .data = ggstatsplot::movies_long,
##D     rating == 7,
##D     genre %in% c("Drama", "Comedy")
##D   ),
##D   x = budget,
##D   y = length,
##D   grouping.var = genre,
##D   bf.message = TRUE,
##D   label.var = "title",
##D   marginal = FALSE,
##D   title.prefix = "Genre",
##D   caption.text = "All movies have IMDB rating equal to 7."
##D )
## End(Not run)




library(ggstatsplot)


### Name: grouped_ggbetweenstats
### Title: Violin plots for group or condition comparisons in
###   between-subjects designs repeated across all levels of a grouping
###   variable.
### Aliases: grouped_ggbetweenstats

### ** Examples


# to get reproducible results from bootstrapping
set.seed(123)

# the most basic function call
ggstatsplot::grouped_ggbetweenstats(
  data = dplyr::filter(ggplot2::mpg, drv != "4"),
  x = year,
  y = hwy,
  grouping.var = drv,
  conf.level = 0.99,
  bf.message = TRUE
)
## Not run: 
##D # modifying individual plots using `ggplot.component` argument
##D ggstatsplot::grouped_ggbetweenstats(
##D   data = dplyr::filter(
##D     ggstatsplot::movies_long,
##D     genre %in% c("Action", "Comedy"),
##D     mpaa %in% c("R", "PG")
##D   ),
##D   x = genre,
##D   y = rating,
##D   grouping.var = mpaa,
##D   results.subtitle = FALSE,
##D   ggplot.component = ggplot2::scale_y_continuous(breaks = seq(1, 9, 1)),
##D   messages = FALSE
##D )
## End(Not run)





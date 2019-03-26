library(ggstatsplot)


### Name: ggbetweenstats
### Title: Box/Violin plots for group or condition comparisons in
###   between-subjects designs.
### Aliases: ggbetweenstats

### ** Examples


# to get reproducible results from bootstrapping
set.seed(123)

# simple function call with the defaults
ggstatsplot::ggbetweenstats(
  data = mtcars,
  x = am,
  y = mpg,
  title = "Fuel efficiency by type of car transmission",
  caption = "Transmission (0 = automatic, 1 = manual)",
  bf.message = TRUE
)
## Not run: 
##D # more detailed function call
##D ggstatsplot::ggbetweenstats(
##D   data = datasets::morley,
##D   x = Expt,
##D   y = Speed,
##D   plot.type = "box",
##D   conf.level = 0.99,
##D   xlab = "The experiment number",
##D   ylab = "Speed-of-light measurement",
##D   pairwise.comparisons = TRUE,
##D   pairwise.annotation = "p.value",
##D   p.adjust.method = "fdr",
##D   outlier.tagging = TRUE,
##D   outlier.label = Run,
##D   nboot = 10,
##D   ggtheme = ggplot2::theme_grey(),
##D   ggstatsplot.layer = FALSE,
##D   bf.message = TRUE
##D )
## End(Not run)




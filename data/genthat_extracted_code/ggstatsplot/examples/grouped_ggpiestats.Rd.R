library(ggstatsplot)


### Name: grouped_ggpiestats
### Title: Grouped pie charts with statistical tests
### Aliases: grouped_ggpiestats

### ** Examples


# grouped one-sample proportion tests
ggstatsplot::grouped_ggpiestats(
  data = mtcars,
  grouping.var = am,
  main = cyl
)

# without condition and with count data
library(jmv)

ggstatsplot::grouped_ggpiestats(
  data = as.data.frame(HairEyeColor),
  main = Hair,
  counts = Freq,
  grouping.var = Sex
)

# the following will take slightly more amount of time
## Not run: 
##D # for reproducibility
##D set.seed(123)
##D 
##D # let's create a smaller dataframe
##D diamonds_short <- ggplot2::diamonds %>%
##D   dplyr::filter(.data = ., cut %in% c("Fair", "Very Good", "Ideal")) %>%
##D   dplyr::sample_frac(tbl = ., size = 0.10)
##D 
##D # plot
##D ggstatsplot::grouped_ggpiestats(
##D   data = diamonds_short,
##D   main = color,
##D   condition = clarity,
##D   grouping.var = cut,
##D   bf.message = TRUE,
##D   sampling.plan = "poisson",
##D   title.prefix = "Quality",
##D   slice.label = "both",
##D   messages = FALSE,
##D   perc.k = 1,
##D   nrow = 3
##D )
## End(Not run)




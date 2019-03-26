library(ggstatsplot)


### Name: grouped_ggdotplotstats
### Title: Grouped histograms for distribution of a labelled numeric
###   variable
### Aliases: grouped_ggdotplotstats

### ** Examples


# for reproducibility
set.seed(123)

# removing factor level with very few no. of observations
df <- dplyr::filter(.data = ggplot2::mpg, cyl %in% c("4", "6", "8"))

# plot
ggstatsplot::grouped_ggdotplotstats(
  data = df,
  x = "cty",
  y = "manufacturer",
  grouping.var = "cyl",
  test.value = 15.5,
  title.prefix = "cylinder count",
  ggplot.component = ggplot2::scale_x_continuous(
    sec.axis = ggplot2::dup_axis(),
    limits = c(12, 24),
    breaks = seq(12, 24, 2)
  ),
  messages = FALSE
)




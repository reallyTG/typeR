library(ggstatsplot)


### Name: ggscatterstats
### Title: Scatterplot with marginal distributions
### Aliases: ggscatterstats

### ** Examples


# to get reproducible results from bootstrapping
set.seed(123)

# creating dataframe
mtcars_new <- mtcars %>%
  tibble::rownames_to_column(., var = "car") %>%
  tibble::as_tibble(x = .)

# simple function call with the defaults
ggstatsplot::ggscatterstats(
  data = mtcars_new,
  x = wt,
  y = mpg,
  type = "np",
  label.var = car,
  label.expression = wt < 4 & mpg < 20,
  axes.range.restrict = TRUE,
  centrality.para = "median",
  xfill = NULL
)




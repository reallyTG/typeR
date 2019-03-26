library(mosaicCore)


### Name: df_stats
### Title: Calculate statistics on a variable
### Aliases: df_stats

### ** Examples

df_stats( ~ hp, data = mtcars)
# There are several ways to specify functions
df_stats( ~ hp, data = mtcars, mean, trimmed_mean = mean(trim = 0.1), "median",
  range, Q = quantile(c(0.25, 0.75)))
# When using ::, be sure to include parents, even if there are no additional arguments.
df_stats( ~ hp, data = mtcars, mean = base::mean(), trimmed_mean = base::mean(trim = 0.1))

# force names to by syntactically valid
df_stats( ~ hp, data = mtcars, Q = quantile(c(0.25, 0.75)), nice_names = TRUE)
# shorter names
df_stats( ~ hp, data = mtcars, mean, trimmed_mean = mean(trim = 0.1), "median", range,
  long_names = FALSE)
# wide vs long format
df_stats( hp ~ cyl, data = mtcars, mean, median, range)
df_stats( hp ~ cyl, data = mtcars, mean, median, range, format = "long")
# More than one grouping variable -- 3 ways.
df_stats( hp ~ cyl + gear, data = mtcars, mean, median, range)
df_stats( hp ~ cyl | gear, data = mtcars, mean, median, range)
df_stats( hp ~ cyl, groups = gear, data = mtcars, mean, median, range)

# because the result is a data frame, df_stats() is also useful for creating plots
if(require(ggformula)) {
  gf_violin(hp ~ cyl, data = mtcars, group = ~ cyl) %>%
  gf_point(mean_hp ~ cyl, data = df_stats(hp ~ cyl, data = mtcars, mean),
    color = ~ "mean") %>%
  gf_point(median_hp ~ cyl, data = df_stats(hp ~ cyl, data = mtcars, median),
    color = ~"median") %>%
  gf_labs(color = "")
}

# magrittr style piping is also supported
if (require(ggformula)) {
  mtcars %>%
    df_stats(hp ~ cyl, mean, median, range)
  mtcars %>%
    df_stats(hp ~ cyl + gear, mean, median, range) %>%
    gf_point(mean_hp ~ cyl, color = ~ factor(gear)) %>%
    gf_line(mean_hp ~ cyl, color = ~ factor(gear))
}

# can be used with a categorical response, too
if (require(mosaic)) {
  df_stats(sex ~ substance, data = HELPrct, table, prop_female = prop)
}
if (require(mosaic)) {
  df_stats(sex ~ substance, data = HELPrct, table, props)
}




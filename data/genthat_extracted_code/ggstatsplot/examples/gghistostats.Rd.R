library(ggstatsplot)


### Name: gghistostats
### Title: Histogram for distribution of a numeric variable
### Aliases: gghistostats

### ** Examples


# most basic function call with the defaults
# this is the **only** function where data argument can be `NULL`
ggstatsplot::gghistostats(
  x = ToothGrowth$len,
  xlab = "Tooth length",
  centrality.para = "median"
)

# a detailed function call
ggstatsplot::gghistostats(
  data = iris,
  x = Sepal.Length,
  bar.measure = "mix",
  type = "p",
  bf.message = TRUE,
  caption = substitute(paste(italic("Note"), ": Iris dataset by Fisher.")),
  bf.prior = 0.8,
  test.value = 3,
  test.value.line = TRUE,
  binwidth = 0.10,
  bar.fill = "grey50"
)




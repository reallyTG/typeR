library(ggstatsplot)


### Name: grouped_ggcorrmat
### Title: Visualization of a correlalogram (or correlation matrix) for all
###   levels of a grouping variable
### Aliases: grouped_ggcorrmat

### ** Examples


# for reproducibility
set.seed(123)

# for plot
# (without specifiying needed variables; all numeric variables will be used)
ggstatsplot::grouped_ggcorrmat(
  data = ggplot2::msleep,
  grouping.var = vore
)

# for getting plot
ggstatsplot::grouped_ggcorrmat(
  data = ggplot2::msleep,
  grouping.var = vore,
  cor.vars = sleep_total:bodywt,
  corr.method = "r",
  p.adjust.method = "holm",
  colors = NULL,
  package = "wesanderson",
  palette = "BottleRocket2",
  nrow = 2
)

# for getting correlations
ggstatsplot::grouped_ggcorrmat(
  data = ggplot2::msleep,
  grouping.var = vore,
  cor.vars = sleep_total:bodywt,
  output = "correlations"
)

# for getting confidence intervals
# confidence intervals are not available for **robust** correlation
ggstatsplot::grouped_ggcorrmat(
  data = datasets::iris,
  grouping.var = Species,
  corr.method = "r",
  p.adjust.method = "holm",
  cor.vars = Sepal.Length:Petal.Width,
  output = "ci"
)




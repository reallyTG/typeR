library(ggstatsplot)


### Name: ggcorrmat
### Title: Visualization of a correlalogram (or correlation matrix)
### Aliases: ggcorrmat

### ** Examples


# for reproducibility
set.seed(123)

# if `cor.vars` not specified, all numeric varibles used
ggstatsplot::ggcorrmat(data = iris)

# to get the correlalogram
# note that the function will run even if the vector with variable names is
# not of same length as the number of variables
ggstatsplot::ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_total:bodywt,
  cor.vars.names = c("total sleep", "REM sleep")
) + # further modification using `ggplot2`
  ggplot2::scale_y_discrete(position = "right")

# to get the correlation matrix
ggstatsplot::ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_total:bodywt,
  output = "r"
)

# setting output = "p-values" (or "p") will return the p-value matrix
ggstatsplot::ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_total:bodywt,
  corr.method = "r",
  p.adjust.method = "bonferroni",
  output = "p"
)

# setting `output = "ci"` will return the confidence intervals for unique
# correlation pairs
ggstatsplot::ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_total:bodywt,
  p.adjust.method = "BH",
  output = "ci"
)

# modifying elements of the correlation matrix by changing function defaults
ggstatsplot::ggcorrmat(
  data = datasets::iris,
  cor.vars = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
  sig.level = 0.01,
  ggtheme = ggplot2::theme_bw(),
  hc.order = TRUE,
  matrix.type = "lower",
  outline.col = "white",
  title = "Dataset: Iris"
)




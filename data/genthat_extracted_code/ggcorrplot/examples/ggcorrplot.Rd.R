library(ggcorrplot)


### Name: ggcorrplot
### Title: Visualization of a correlation matrix using ggplot2
### Aliases: ggcorrplot cor_pmat

### ** Examples

# Compute a correlation matrix
data(mtcars)
corr <- round(cor(mtcars), 1)
corr

# Compute a matrix of correlation p-values
p.mat <- cor_pmat(mtcars)
p.mat

# Visualize the correlation matrix
# --------------------------------
# method = "square" or "circle"
ggcorrplot(corr)
ggcorrplot(corr, method = "circle")

# Reordering the correlation matrix
# --------------------------------
# using hierarchical clustering
ggcorrplot(corr, hc.order = TRUE, outline.col = "white")

# Types of correlogram layout
# --------------------------------
# Get the lower triangle
ggcorrplot(corr,
  hc.order = TRUE, type = "lower",
  outline.col = "white"
)
# Get the upeper triangle
ggcorrplot(corr,
  hc.order = TRUE, type = "upper",
  outline.col = "white"
)

# Change colors and theme
# --------------------------------
# Argument colors
ggcorrplot(corr,
  hc.order = TRUE, type = "lower",
  outline.col = "white",
  ggtheme = ggplot2::theme_gray,
  colors = c("#6D9EC1", "white", "#E46726")
)

# Add correlation coefficients
# --------------------------------
# argument lab = TRUE
ggcorrplot(corr,
  hc.order = TRUE, type = "lower",
  lab = TRUE,
  ggtheme = ggplot2::theme_dark(),
)

# Add correlation significance level
# --------------------------------
# Argument p.mat
# Barring the no significant coefficient
ggcorrplot(corr,
  hc.order = TRUE,
  type = "lower", p.mat = p.mat
)
# Leave blank on no significant coefficient
ggcorrplot(corr,
  p.mat = p.mat, hc.order = TRUE,
  type = "lower", insig = "blank"
)




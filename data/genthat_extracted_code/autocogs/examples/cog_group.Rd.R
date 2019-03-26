library(autocogs)


### Name: cog_group
### Title: Cog group data frame
### Aliases: cog_group

### ** Examples

cog_group(
  "univariate_discrete", "x", "_x",
  "univariate_counts", "x", "_n"
)
cog_group(
  "univariate_continuous", "x", "_x",
  "univariate_continuous", "y", "_y",
  "bivariate_continuous", c("x", "y"), "_bivar",
  "scagnostics", c("x", "y"), "_scagnostic",
  "bivariate_counts", c("x", "y"), "_n"
)




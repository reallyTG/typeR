library(ggstatsplot)


### Name: outlier_df
### Title: Adding a column to dataframe describing outlier status.
### Aliases: outlier_df

### ** Examples

# adding column for outlier and a label for that outlier
ggstatsplot::outlier_df(
  data = morley,
  x = Expt,
  y = Speed,
  outlier.label = Run,
  outlier.coef = 2
) %>%
  dplyr::arrange(outlier)




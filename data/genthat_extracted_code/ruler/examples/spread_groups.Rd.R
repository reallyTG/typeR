library(ruler)


### Name: spread_groups
### Title: Spread grouping columns
### Aliases: spread_groups

### ** Examples

mtcars_grouped_summary <- mtcars %>%
  dplyr::group_by(vs, am) %>%
  dplyr::summarise(n_low = dplyr::n() > 6, n_high = dplyr::n() < 10)

spread_groups(mtcars_grouped_summary, vs, am)

spread_groups(mtcars_grouped_summary, vs, am, .group_sep = "__")

spread_groups(mtcars_grouped_summary, vs, am, .col_sep = "__")





library(ruler)


### Name: group-pack
### Title: Group rule pack
### Aliases: group-pack

### ** Examples

vs_am_rules <- . %>%
  dplyr::group_by(vs, am) %>%
  dplyr::summarise(nrow_low = n(.) > 10,
                   nrow_up = n(.) < 20,
                   rowmeans_low = rowMeans(.) > 19)

group_packs(vs_am = vs_am_rules, .group_vars = c("vs", "am"))





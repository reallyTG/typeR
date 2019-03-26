library(ruler)


### Name: data-pack
### Title: Data rule pack
### Aliases: data-pack

### ** Examples

data_dims_rules <- . %>%
  dplyr::summarise(nrow_low = nrow(.) > 10,
                   nrow_up = nrow(.) < 20,
                   ncol_low = ncol(.) > 5,
                   ncol_up = ncol(.) < 10)
data_na_rules <- . %>%
  dplyr::summarise(all_not_na = Negate(anyNA)(.))

data_packs(
  data_nrow = data_dims_rules,
  data_na = data_na_rules
)





library(ruler)


### Name: row-pack
### Title: Row rule pack
### Aliases: row-pack

### ** Examples

some_row_mean_rules <- . %>% dplyr::slice(1:3) %>%
  dplyr::mutate(row_mean = rowMeans(.)) %>%
  dplyr::transmute(
    row_mean_low = row_mean > 10,
    row_mean_up = row_mean < 20
  )
all_row_sum_rules <- . %>% dplyr::mutate(row_sum = rowSums(.)) %>%
  dplyr::transmute(row_sum_low = row_sum > 30)

row_packs(
  some_row_mean_rules,
  all_row_sum_rules
)





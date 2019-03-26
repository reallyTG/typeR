library(ruler)


### Name: packs_info
### Title: Packs info
### Aliases: packs_info is_packs_info get_packs_info

### ** Examples

my_row_packs <- row_packs(
  row_mean_props = . %>% dplyr::transmute(row_mean = rowMeans(.)) %>%
    dplyr::transmute(
      row_mean_low = row_mean > 20,
      row_mean_high = row_mean < 60
    ),
  row_outlier = . %>% dplyr::transmute(row_sum = rowSums(.)) %>%
    dplyr::transmute(
      not_row_outlier = abs(row_sum - mean(row_sum)) / sd(row_sum) < 1.5
    )
)
my_data_packs <- data_packs(
  data_dims = . %>% dplyr::summarise(nrow = nrow(.) == 32,
                                     ncol = ncol(.) == 5)
)

mtcars_exposed <- mtcars %>%
  expose(my_data_packs, .remove_obeyers = FALSE) %>%
  expose(my_row_packs)

mtcars_exposed %>% get_packs_info()

mtcars_exposed %>% get_packs_info() %>% is_packs_info()





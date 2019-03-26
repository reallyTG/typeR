library(ruler)


### Name: exposure
### Title: Exposure
### Aliases: exposure is_exposure get_exposure remove_exposure

### ** Examples

my_col_packs <- col_packs(
  col_sum_props = . %>% dplyr::summarise_all(
    rules(
      col_sum_low = sum(.) > 100,
      col_sum_high = sum(.) < 1000
    )
  )
)
mtcars_exposed <- mtcars %>% expose(my_col_packs)
mtcars_exposure <- mtcars_exposed %>% get_exposure()

is_exposure(mtcars_exposure)

identical(remove_exposure(mtcars_exposed), mtcars)

identical(get_exposure(mtcars_exposure), mtcars_exposure)





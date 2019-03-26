library(ruler)


### Name: bind_exposures
### Title: Bind exposures
### Aliases: bind_exposures

### ** Examples

my_data_packs <- data_packs(
  data_dims = . %>% dplyr::summarise(nrow_low = nrow(.) < 10),
  data_sum = . %>% dplyr::summarise(sum = sum(.) < 1000)
)

ref_exposure <- mtcars %>% expose(my_data_packs) %>% get_exposure()

exposure_1 <- mtcars %>% expose(my_data_packs[1]) %>% get_exposure()
exposure_2 <- mtcars %>% expose(my_data_packs[2]) %>% get_exposure()
exposure_binded <- bind_exposures(exposure_1, exposure_2)

exposure_pipe <- mtcars %>%
  expose(my_data_packs[1]) %>% expose(my_data_packs[2]) %>%
  get_exposure()

identical(exposure_binded, ref_exposure)

identical(exposure_pipe, ref_exposure)





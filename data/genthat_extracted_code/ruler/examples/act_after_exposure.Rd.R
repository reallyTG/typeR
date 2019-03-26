library(ruler)


### Name: act_after_exposure
### Title: Act after exposure
### Aliases: act_after_exposure

### ** Examples

exposure_printer <- function(.tbl) {print(get_exposure(.tbl)); .tbl}
mtcars_exposed <- mtcars %>%
  expose(data_packs(. %>% dplyr::summarise(nrow_low = nrow(.) > 50))) %>%
  act_after_exposure(any_breaker, exposure_printer)





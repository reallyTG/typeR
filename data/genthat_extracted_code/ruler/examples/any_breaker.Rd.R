library(ruler)


### Name: any_breaker
### Title: Is there any breaker in exposure?
### Aliases: any_breaker

### ** Examples

mtcars %>%
  expose(data_packs(. %>% dplyr::summarise(nrow_low = nrow(.) > 50))) %>%
  any_breaker()





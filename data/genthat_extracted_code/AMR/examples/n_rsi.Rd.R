library(AMR)


### Name: n_rsi
### Title: Count cases with antimicrobial results
### Aliases: n_rsi

### ** Examples

library(dplyr)

septic_patients %>%
  group_by(hospital_id) %>%
  summarise(cipro_p = portion_S(cipr, as_percent = TRUE),
            cipro_n = n_rsi(cipr),
            genta_p = portion_S(gent, as_percent = TRUE),
            genta_n = n_rsi(gent),
            combination_p = portion_S(cipr, gent, as_percent = TRUE),
            combination_n = n_rsi(cipr, gent))




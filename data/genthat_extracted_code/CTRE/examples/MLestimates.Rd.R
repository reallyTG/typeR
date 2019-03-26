library(CTRE)


### Name: MLestimates
### Title: Mittag-Leffler estimates for varying thresholds
### Aliases: MLestimates

### ** Examples

  library(magrittr)
  par(mfrow = c(1,2))
  flares %>% ctre() %>% thin(k=1000) %>% MLestimates(tail = 0.9, scale = 3E7)

  bitcoin %>% ctre() %>% thin(k=500) %>% MLestimates(tail = 0.9, scale = 2.5E3)
  bitcoin %>% ctre() %>% thin(k=500) %>% MLestimates(plot_me = FALSE) %>% str()




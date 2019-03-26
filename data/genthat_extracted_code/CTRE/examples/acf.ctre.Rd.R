library(CTRE)


### Name: acf.ctre
### Title: Autocorrelation function
### Aliases: acf.ctre

### ** Examples

  library(magrittr)
  flares %>% ctre() %>% thin(k=150) %>% acf()




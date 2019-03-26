library(CTRE)


### Name: thin
### Title: Apply a higher threshold to a CTRE process
### Aliases: thin

### ** Examples

  library(magrittr)
  flares %>% ctre() %>% plot(log = 'y')
  flares %>% ctre() %>% thin(k=500) %>% plot(log = 'y')




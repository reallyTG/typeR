library(CTRE)


### Name: mlqqplot
### Title: Mittag-Leffler QQ Plot
### Aliases: mlqqplot

### ** Examples

  library(magrittr)
  flares %>% ctre() %>% thin(k=200) %>% interarrival() %>% mlqqplot(tail = 1, log = 'xy')
  flares %>% ctre() %>% thin(k=200) %>% interarrival() %>% mlqqplot(tail = 0.8, log = 'xy')

  seaquakes %>% ctre() %>% thin(k=150) %>% interarrival() %>% mlqqplot(tail = 0.9, log = 'xy')




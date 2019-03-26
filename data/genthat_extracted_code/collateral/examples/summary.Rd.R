library(collateral)


### Name: summary
### Title: Summarise mapped side effects.
### Aliases: summary summary.safely_mapped summary.quietly_mapped

### ** Examples


library(magrittr)

list("a", 10, 100) %>% map_safely(log) %>% summary()
list(5, -12, 103) %>% map_quietly(log) %>% summary()





library(radiant.data)


### Name: refactor
### Title: Remove/reorder levels
### Aliases: refactor

### ** Examples

refactor(diamonds$cut, c("Premium","Ideal")) %>% head()
refactor(diamonds$cut, c("Premium","Ideal"), "Other") %>% head()





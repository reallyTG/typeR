library(cleanEHR)


### Name: new.episode
### Title: Create a new episode
### Aliases: new.episode

### ** Examples

eps <- list()
eps[["NIHR_HIC_ICU_0018"]] <- data.frame(time=seq(10), rep(70, 10))
new.episode(eps)





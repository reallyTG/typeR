library(stackoverflow)


### Name: copyEnv
### Title: Copy objects from one environment to another
### Aliases: copyEnv

### ** Examples


e1 <- list2env(list(a=1, b=2))
e2 <- new.env()
copyEnv(e1,e2)
ls(e2)




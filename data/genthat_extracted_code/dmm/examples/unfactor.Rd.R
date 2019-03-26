library(dmm)


### Name: unfactor
### Title: Convert a vector from factor to numeric
### Aliases: unfactor
### Keywords: Methods Misc

### ** Examples


library(dmm)
tmp <- as.factor(c(1,2,3))
str(tmp)
utmp <- unfactor(tmp)
str(utmp)
rm(tmp)
rm(utmp)




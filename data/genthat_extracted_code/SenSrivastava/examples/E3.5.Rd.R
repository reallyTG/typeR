library(SenSrivastava)


### Name: E3.5
### Title: Women's World Record Times for Running and Corresponding
###   Distances
### Aliases: E3.5
### Keywords: datasets

### ** Examples

data(E3.5)
data(E3.4)
summary(E3.5)
summary(E3.4)
records <- rbind(E3.5,E3.4)
sex <- factor(c(rep("F", 6), rep("M", 13)))
records$sex <- sex
summary(records)




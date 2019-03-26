library(BSDA)


### Name: Situp
### Title: Maximum number of situps by participants in an exercise class
### Aliases: Situp
### Keywords: datasets

### ** Examples


stem(Situp$number)
hist(Situp$number, breaks = seq(0, 70, 10), right = FALSE)
hist(Situp$number, breaks = seq(0, 70, 10), right = FALSE, 
     freq = FALSE, col = "pink", main = "Problem 1.47", 
     xlab = "Maximum number of situps")
lines(density(Situp$number), col = "red")





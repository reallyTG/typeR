library(PatternClass)


### Name: doubleplotter
### Title: A comparison of two maps based on their empirical (null)
###   distributions for a class-focused pattern metric
### Aliases: doubleplotter
### Keywords: distribution

### ** Examples

result1 <- singlemap(IMG = data$demoimage1, VERBOSE = TRUE, reps = 10, LEVEL=6) 
result2 <- singlemap(IMG = data$demoimage2, VERBOSE = TRUE, reps = 10, LEVEL=6)
doubleplotter(data1 = result1, data2 = result2, img1 = data$demoimage1, 
img2 = data$demoimage2, metric = 5) 




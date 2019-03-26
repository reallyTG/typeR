library(PatternClass)


### Name: singleplotter
### Title: Depict the empirical (null) distribution for class-focused
###   pattern metrics.
### Aliases: singleplotter
### Keywords: distributions

### ** Examples

result1 <- singlemap(IMG=data$demoimage1, VERBOSE=TRUE, reps=10, LEVEL=6)
singleplotter(data =  result1, img = data$demoimage1, metrics = c(1, 5, 10), 
rows = 1, cols = 3, addactual = TRUE, colour = TRUE)




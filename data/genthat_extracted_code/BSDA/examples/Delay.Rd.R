library(BSDA)


### Name: Delay
### Title: Delay times on 20 flights from four major air carriers
### Aliases: Delay
### Keywords: datasets

### ** Examples


boxplot(delay ~ carrier, data = Delay, 
        main = "Exercise 10.55", ylab = "minutes",
        col = "pink")
kruskal.test(delay ~carrier, data = Delay)





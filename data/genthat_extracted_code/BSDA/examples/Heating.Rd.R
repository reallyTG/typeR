library(BSDA)


### Name: Heating
### Title: Fuel efficiency ratings for three types of oil heaters
### Aliases: Heating
### Keywords: datasets

### ** Examples


boxplot(efficiency ~ type, data = Heating, 
        col = c("red", "blue", "green"))
kruskal.test(efficiency ~ type, data = Heating)





library(BSDA)


### Name: Hostile
### Title: Hostility levels of high school students from rural, suburban,
###   and urban areas
### Aliases: Hostile
### Keywords: datasets

### ** Examples


boxplot(hostility ~ location, data = Hostile, 
        col = c("red", "blue", "green"))
kruskal.test(hostility ~ location, data = Hostile)





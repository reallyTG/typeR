library(replyr)


### Name: replyr_arrange
### Title: arrange by a single column
### Aliases: replyr_arrange

### ** Examples


d <- data.frame(Sepal_Length= c(5.8,5.7),
                Sepal_Width= c(4.0,4.4))
replyr_arrange(d, 'Sepal_Length', descending= TRUE)





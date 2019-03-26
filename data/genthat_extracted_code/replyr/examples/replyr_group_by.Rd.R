library(replyr)


### Name: replyr_group_by
### Title: group_by columns
### Aliases: replyr_group_by

### ** Examples


d <- data.frame(Sepal_Length= c(5.8,5.7),
                Sepal_Width= c(4.0,4.4),
                Species= 'setosa')
replyr_group_by(d, 'Species')





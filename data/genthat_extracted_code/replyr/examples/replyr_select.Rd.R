library(replyr)


### Name: replyr_select
### Title: select columns
### Aliases: replyr_select

### ** Examples


d <- data.frame(Sepal_Length= c(5.8,5.7),
                Sepal_Width= c(4.0,4.4),
                Species= 'setosa', rank=c(1,2))
replyr_select(d, c('Sepal_Length', 'Species'))





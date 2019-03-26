library(replyr)


### Name: replyr_rename
### Title: Rename a column
### Aliases: replyr_rename

### ** Examples


d <- data.frame(Sepal_Length= c(5.8,5.7),
                Sepal_Width= c(4.0,4.4),
                Species= 'setosa', rank=c(1,2))
replyr_rename(d, newName = 'family', oldName = 'Species')





library(extracat)


### Name: getpath
### Title: Path extracation from quickfechner objects
### Aliases: getpath

### ** Examples

#not a distance matrix, but a similarity matrix in some sense
cx <- 1-abs(cor(olives[-c(1,2,11)]))

cx2 <- quickfechner(cx)
getpath(cx2,from=1,to=5)





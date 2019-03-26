library(rowr)


### Name: count
### Title: A more versatile form of the T-SQL 'count()' function.
### Aliases: count

### ** Examples

count(c(NA,1,2))
count(c(NA,1,2),is.na)
count(c(NA,1,2),list('A',4),cbind(1,2,3))
count(c(NA,1,2),list('A',4),cbind(1,2,3),condition=is.character)




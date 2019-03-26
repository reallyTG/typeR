library(questionr)


### Name: multi.split
### Title: Split a multiple choices variable in a series of binary
###   variables
### Aliases: multi.split

### ** Examples

v <- c("red/blue","green","red/green","blue/red")
multi.split(v)
## One-way frequency table of the result
multi.table(multi.split(v))




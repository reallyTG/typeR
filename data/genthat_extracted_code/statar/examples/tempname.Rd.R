library(statar)


### Name: tempname
### Title: Create unique names within a list, a data.frame, or an
###   environment
### Aliases: tempname

### ** Examples

tempname(c("temp1", "temp3"), 4)
tempname(globalenv())
tempname(data.frame(temp = 1), n = 3)




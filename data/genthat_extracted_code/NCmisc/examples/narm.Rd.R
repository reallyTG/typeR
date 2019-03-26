library(NCmisc)


### Name: narm
### Title: Return an object with missing values removed.
### Aliases: narm

### ** Examples

narm(c(1,2,4,NA,5))
DF <- data.frame(x = c(1, 2, 3), y = c(0, 10, NA))
DF; narm(DF)
# if a list, will only completely remove NA from the lowest levels
# empty places will be left at top levels
print(narm(list(1,2,3,NA,list(1,2,3,NA))))




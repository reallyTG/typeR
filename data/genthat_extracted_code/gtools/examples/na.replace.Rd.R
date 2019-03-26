library(gtools)


### Name: na.replace
### Title: Replace Missing Values
### Aliases: na.replace
### Keywords: manip

### ** Examples

   x <- c(1,2,3,NA,6,7,8,NA,NA)
   
   # Replace with a specified value
   na.replace(x, '999')
   
   # Replace with the calculated median
   na.replace(x, median, na.rm=TRUE)    




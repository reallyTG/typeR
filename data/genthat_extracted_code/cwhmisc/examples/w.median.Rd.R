library(cwhmisc)


### Name: w.median
### Title: Weighted median
### Aliases: w.median
### Keywords: robust

### ** Examples

w.median(c(7,1,2,4,10,15),c(1,1/3,1/3,1/3,1,1)) #  7
w.median(c(1,2,4,7,10,15),c(1/3,1/3,1/3,1,1,1)) #  7
w.median(c(7,7/3,10,15)) # 7
     # '1','2','4 of weights='1/3' are replaced by '7/3' (weight=1)
w.median(c(7,1,2,4,10),c(1,1/3,1/3,1/3,1)) #  7
w.median(c(7,1,2,4,10)) #  4
w.median(c(7,1,NA,4,10),c(1,1/3,1/3,1/3,1)) # 7




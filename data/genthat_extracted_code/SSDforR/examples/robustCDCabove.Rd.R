library(SSDforR)


### Name: RobustCDCabove
### Title: Robust Conservative Dual Criteria (CDC) using robust regression
###   desired zone above lines
### Aliases: RobustCDCabove
### Keywords: ~kwd1 ~kwd2

### ** Examples

cry<-c(3, 4, 2, 5, 3, 4, NA, 2, 2, 3, 2, 1, 2, NA, 2, 2, 1, 2, 1, 0, 0, 0)
pcry<-c("A", "A", "A", "A", "A", "A", NA, "B", "B", "B", "B", "B", "B", NA,
"B1", "B1", "B1", "B1", "B1", "B1", "B1", "B1")
RobustCDCabove(cry,pcry,"A","B")




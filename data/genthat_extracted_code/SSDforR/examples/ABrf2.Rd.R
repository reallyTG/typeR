library(SSDforR)


### Name: ABrf2
### Title: Lag-1 autocorrelation (rf2 for small sample size)
### Aliases: ABrf2
### Keywords: ~kwd1 ~kwd2

### ** Examples

cry<-c(3, 4, 2, 5, 3, 4, NA, 2, 2, 3, 2, 1, 2, NA, 2, 2, 1, 2, 1, 0, 0, 0)
pcry<-c("A", "A", "A", "A", "A", "A", NA, "B", "B", "B", "B", "B", "B", NA,
"B1", "B1", "B1", "B1", "B1", "B1", "B1", "B1")
ABrf2(cry, pcry, "B1")




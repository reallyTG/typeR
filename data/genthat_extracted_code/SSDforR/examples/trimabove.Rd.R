library(SSDforR)


### Name: trimabove
### Title: Chi-square - desired values above the trimmed mean
### Aliases: trimabove
### Keywords: ~kwd1 ~kwd2

### ** Examples

esteem<-c(3, 4, 2, 5, 3, 4, NA, 2, 2, 3, 2, 1, 2, NA, 2, 2, 1, 2, 1, 0, 0, 0)
pesteem<-c("A", "A", "A", "A", "A", "A", NA, "B", "B", "B", "B", "B", "B", 
NA, "B1", "B1", "B1", "B1", "B1", "B1", "B1", "B1")
trimabove(esteem, pesteem,"A","B1")




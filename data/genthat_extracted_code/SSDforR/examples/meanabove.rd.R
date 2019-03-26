library(SSDforR)


### Name: meanabove
### Title: Chi-square - desired values above the mean
### Aliases: meanabove
### Keywords: ~kwd1 ~kwd2

### ** Examples

esteem<-c(3, 4, 2, 5, 3, 4, NA, 2, 2, 3, 2, 1, 2, NA, 
2, 2, 1, 2, 1, 0, 0, 0)
pesteem<-c("A", "A", "A", "A", "A", "A", NA, 
"B", "B", "B", "B", "B", "B",
NA, "B1", "B1", "B1", "B1", "B1", "B1", "B1", "B1")
meanabove(esteem, pesteem, "A","B1")




library(FuzzyStatTra)


### Name: filterNA
### Title: Deleting missing values
### Aliases: filterNA
### Keywords: NA

### ** Examples

# Example 1:
F=matrix(c(1,2,3,NA,5,4,7,2),nrow=2)
filterNA(F)

# Example 2:
F=matrix(c(1,2,3,NA,5,4,7,2,1,2,3,4),nrow=3)
filterNA(F)

# Example 3:
data(M2)
filterNA(M2)




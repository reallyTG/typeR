library(data.table)


### Name: like
### Title: Convenience function for calling regexpr.
### Aliases: like %like%
### Keywords: data

### ** Examples

DT = data.table(Name=c("Mary","George","Martha"), Salary=c(2,3,4))
DT[Name %like% "^Mar"]




library(HRW)


### Name: schoolResults
### Title: School results in the United Kingdom
### Aliases: schoolResults

### ** Examples

library(HRW) ; data(schoolResults)
if (require("lattice"))
   print(xyplot(writtenScore ~ courseScore|factor(schoolID),
                groups = female,data = schoolResults))




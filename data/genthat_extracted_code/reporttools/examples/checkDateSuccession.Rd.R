library(reporttools)


### Name: checkDateSuccession
### Title: Check whether dates in two vectors are elementwise consecutive
### Aliases: checkDateSuccession
### Keywords: manip chron

### ** Examples

set.seed(1977)
diagnosis <- as.Date(round(runif(10, min = 35000, max = 40000)), 
    origin = "1899-12-30")
death <- as.Date(round(runif(10, min = 35000, max = 40000)), 
    origin = "1899-12-30")

## check whether diagnosis was before death
checkDateSuccession(diagnosis, death, 1:10, names = c("Pat", 
    "diagnosis", "death"), lab = "tab: diag --> death") 

checkDateSuccession(diagnosis, death, 1:10, names = c("Pat", 
    "diagnosis", "death"), lab = "tab: diag --> death", typ = "R") 




library(openintro)


### Name: CT2DF
### Title: Contingency Table to Data Frame
### Aliases: CT2DF

### ** Examples

a <- matrix(
    c(459, 727, 854, 385, 99, 4198, 6245, 4821, 1634, 578),
    2,
    byrow = TRUE)
b <- 
CT2DF(
    a,
    c("No", "Yes"),
    c("Excellent", "Very good", "Good", "Fair", "Poor"),
    c("coverage", "health_status"))
table(b)




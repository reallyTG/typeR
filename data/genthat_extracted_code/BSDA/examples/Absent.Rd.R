library(BSDA)


### Name: Absent
### Title: Number of absent days for 20 employees
### Aliases: Absent
### Keywords: datasets

### ** Examples


CT <- xtabs(~ days, data = Absent)
CT
barplot(CT, col = "pink", main = "Exercise 1.28")
plot(ecdf(Absent$days), main = "ECDF")





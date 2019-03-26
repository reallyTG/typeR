library(BSDA)


### Name: Defectiv
### Title: Number of defective items produced by 20 employees
### Aliases: Defectiv
### Keywords: datasets

### ** Examples


T1 <- xtabs(~ number, data = Defectiv)
T1
barplot(T1, col = "pink", ylab = "Frequency",
xlab = "Defective Items Produced by Employees", main = "Problem 1.27")
rm(T1)





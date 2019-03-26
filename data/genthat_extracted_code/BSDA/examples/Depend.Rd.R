library(BSDA)


### Name: Depend
### Title: Number of dependent children for 50 families
### Aliases: Depend
### Keywords: datasets

### ** Examples


T1 <- xtabs(~ number, data = Depend)
T1
barplot(T1, col = "lightblue", main = "Problem 1.26",
xlab = "Number of Dependent Children", ylab = "Frequency")
rm(T1)





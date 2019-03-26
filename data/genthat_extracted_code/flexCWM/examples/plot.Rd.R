library(flexCWM)


### Name: plot.cwm
### Title: Plot for CWMs
### Aliases: plot.cwm

### ** Examples

data("students")
attach(students)
str(students)
fit2 <- cwm(WEIGHT ~ HEIGHT + HEIGHT.F , Xnorm = cbind(HEIGHT, HEIGHT.F), k = 2, 
  initialization = "kmeans", modelXnorm = "EEE")
summary(fit2, concomitant = TRUE)
plot(fit2)





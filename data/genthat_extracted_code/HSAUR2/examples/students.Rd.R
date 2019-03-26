library(HSAUR2)


### Name: students
### Title: Student Risk Taking
### Aliases: students
### Keywords: datasets

### ** Examples


  data("students", package = "HSAUR2")
  layout(matrix(1:2, ncol = 2))
  boxplot(low ~ treatment, data = students, ylab = "low")
  boxplot(high ~ treatment, data = students, ylab = "high")





library(HSAUR)


### Name: students
### Title: Student Risk Taking
### Aliases: students
### Keywords: datasets

### ** Examples


  data("students", package = "HSAUR")
  layout(matrix(1:2, ncol = 2))
  boxplot(low ~ treatment, data = students, ylab = "low")
  boxplot(high ~ treatment, data = students, ylab = "high")





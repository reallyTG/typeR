library(HSAUR)


### Name: clouds
### Title: Cloud Seeding Data
### Aliases: clouds
### Keywords: datasets

### ** Examples


  data("clouds", package = "HSAUR")
  layout(matrix(1:2, nrow = 2))
  boxplot(rainfall ~ seeding, data = clouds, ylab = "Rainfall")
  boxplot(rainfall ~ echomotion, data = clouds, ylab = "Rainfall")    





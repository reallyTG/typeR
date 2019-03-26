library(HSAUR3)


### Name: GHQ
### Title: General Health Questionnaire
### Aliases: GHQ
### Keywords: datasets

### ** Examples


  data("GHQ", package = "HSAUR3")
  male <- subset(GHQ, gender == "male")
  female <- subset(GHQ, gender == "female")
  layout(matrix(1:2, ncol = 2))
  barplot(t(as.matrix(male[,c("cases", "non.cases")])), main = "Male", xlab = "GHC score")
  barplot(t(as.matrix(male[,c("cases", "non.cases")])), main = "Female", xlab = "GHC score")





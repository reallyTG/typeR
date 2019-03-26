library(HSAUR)


### Name: GHQ
### Title: General Health Questionnaire
### Aliases: GHQ
### Keywords: datasets

### ** Examples


  data("GHQ", package = "HSAUR")
  male <- subset(GHQ, sex == "male")
  female <- subset(GHQ, sex == "female")
  layout(matrix(1:2, ncol = 2))
  barplot(t(as.matrix(male[,c("cases", "non.cases")])), main = "Male", xlab = "GHC score")
  barplot(t(as.matrix(male[,c("cases", "non.cases")])), main = "Female", xlab = "GHC score")





library(gmodels)


### Name: CrossTable
### Title: Cross Tabulation with Tests for Factor Independence
### Aliases: CrossTable
### Keywords: category univar

### ** Examples


# Simple cross tabulation of education versus prior induced abortions
# using infertility data
data(infert, package = "datasets")
CrossTable(infert$education, infert$induced, expected = TRUE)
CrossTable(infert$education, infert$induced, expected = TRUE, format="SAS")
CrossTable(infert$education, infert$induced, expected = TRUE, format="SPSS")
CrossTable(warpbreaks$wool, warpbreaks$tension, dnn = c("Wool", "Tension"))




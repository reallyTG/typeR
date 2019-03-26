library(scorecardModelUtils)


### Name: fn_target
### Title: Redefines target value
### Aliases: fn_target

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)

data2 <- fn_target(base = data,target = "Y",event = 1)




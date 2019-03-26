library(multichull)


### Name: MultiCHull
### Title: Convex-Hull-Based Model Selection for multiple Samples
### Aliases: MultiCHull MultiCHull.default plot.MultiCHull print.MultiCHull
###   summary.MultiCHull
### Keywords: models

### ** Examples

data <- cbind(c(305,456,460,607,612,615,758,764,768,770,909,916,921,924),
c(152,89,79,71,57,57,64,49,47,47,60,41,39,39))
test <- array(rnorm(14*20,sd=2.5),c(14,20))
for (i in 1:20){
  data <- cbind(data,data[,2]+test[,i])
}

output <- MultiCHull(data)
summary(output)
plot(output)





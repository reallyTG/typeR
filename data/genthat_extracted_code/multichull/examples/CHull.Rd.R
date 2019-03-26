library(multichull)


### Name: CHull
### Title: A Generic Convex-Hull-Based Model Selection Method
### Aliases: CHull CHull.default plot.CHull print.CHull summary.CHull
### Keywords: models

### ** Examples

complexity.fit <- cbind(c(305,456,460,607,612,615,758,764,768,770,909,916,921,924),
c(152,89,79,71,57,57,64,49,47,47,60,41,39,39))

output <- CHull(complexity.fit)
plot(output)
print(output)
summary(output)





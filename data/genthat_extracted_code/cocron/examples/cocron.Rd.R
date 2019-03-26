library(cocron)


### Name: cocron
### Title: Statistical comparisons of n alpha coefficients
### Aliases: cocron

### ** Examples


data("knowledge")

# independent alpha coefficients
cocron(knowledge, dep=FALSE)

# dependent alpha coefficients
cocron(knowledge, dep=TRUE)





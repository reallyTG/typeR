library(Sleuth2)


### Name: case2101
### Title: Island Size and Bird Extinctions
### Aliases: case2101
### Keywords: datasets

### ** Examples

str(case2101)
logit <- function(p) log(p/(1-p))
plot(logit(Extinct/Atrisk) ~ log(Area), case2101)




library(GDAdata)


### Name: Decathlon
### Title: Top performances in the Decathlon from 1985 to 2006.
### Aliases: Decathlon
### Keywords: datasets

### ** Examples

data(Decathlon, package="GDAdata")
summary(Decathlon[, grep("P.*", names(Decathlon))])
library(ggplot2)
ggplot(Decathlon, aes(Plj)) + geom_histogram()
ggplot(Decathlon, aes(P100m, Plj)) + geom_point()




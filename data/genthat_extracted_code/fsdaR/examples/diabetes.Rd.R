library(fsdaR)


### Name: diabetes
### Title: Diabetes data
### Aliases: diabetes
### Keywords: datasets

### ** Examples

data(diabetes)
head(diabetes)
plot(CovMcd(diabetes[, 1:3]), which="pairs", col=diabetes$class)




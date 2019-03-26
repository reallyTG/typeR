library(ICGE)


### Name: dermatology
### Title: Dermatology Database
### Aliases: dermatology
### Keywords: datasets

### ** Examples

data(dermatology)
x <- dermatology[, 1:34]
group <- as.factor(dermatology[,35])

plot(group)




library(tensorBSS)


### Name: selectComponents
### Title: Select the Most Informative Components
### Aliases: selectComponents
### Keywords: utilities

### ** Examples

library(ElemStatLearn)
x <- zip.train

rows <- which(x[, 1] == 0 | x[, 1] == 1)
x0 <- x[rows, 2:257]

x0 <- t(x0)
dim(x0) <- c(16, 16, 2199)

tfobi <- tFOBI(x0)
comp <- selectComponents(tfobi$S)
head(comp)




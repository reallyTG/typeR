library(CircStats)


### Name: circ.cor
### Title: Correlation Coefficient for Angular Variables
### Aliases: circ.cor
### Keywords: univar

### ** Examples

# Generate two circular data sets, and compute their correlation.
data1 <- rvm(50, 0, 3)
data2 <- data1 + pi + rvm(50, 0, 10)
circ.cor(data1, data2, test=TRUE)




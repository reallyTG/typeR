library(NeuralNetTools)


### Name: lekgrps
### Title: Create optional barplot for 'lekprofile' groups
### Aliases: lekgrps

### ** Examples

## enters used with kmeans clustering
x <- neuraldat[, c('X1', 'X2', 'X3')]
grps <- kmeans(x, 6)$center

lekgrps(grps)




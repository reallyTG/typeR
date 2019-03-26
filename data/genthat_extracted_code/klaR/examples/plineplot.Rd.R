library(klaR)


### Name: plineplot
### Title: Plotting marginal posterior class probabilities
### Aliases: plineplot
### Keywords: classif dplot

### ** Examples

library(MASS)

# The name of the variable can be used for x
data(B3)
plineplot(PHASEN ~ ., data = B3, method = "lda", 
    x = "EWAJW", xlab = "EWAJW")

# The plotted variable need not be in the data
data(iris)
iris2 <- iris[ , c(1,3,5)]
plineplot(Species ~ ., data = iris2, method = "lda", 
    x = iris[ , 4], xlab = "Petal.Width")




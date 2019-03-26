library(msos)


### Name: qda
### Title: Quadratic discrimination
### Aliases: qda

### ** Examples


# Load Iris Data
data(iris)

# Iris example
x.iris <- as.matrix(iris[,1:4])

# Gets group vector (1, ... , 1, 2, ... , 2, 3, ... , 3)
y.iris <- rep(1:3, c(50, 50, 50)) 

# Perform QDA
qd.iris <- qda(x.iris, y.iris)





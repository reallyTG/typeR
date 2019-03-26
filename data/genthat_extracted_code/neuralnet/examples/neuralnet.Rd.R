library(neuralnet)


### Name: neuralnet
### Title: Training of neural networks
### Aliases: neuralnet print.nn
### Keywords: neural

### ** Examples


library(neuralnet)

# Binary classification
nn <- neuralnet(Species == "setosa" ~ Petal.Length + Petal.Width, iris, linear.output = FALSE)
## Not run: print(nn)
## Not run: plot(nn)

# Multiclass classification
nn <- neuralnet(Species ~ Petal.Length + Petal.Width, iris, linear.output = FALSE)
## Not run: print(nn)
## Not run: plot(nn)

# Custom activation function
softplus <- function(x) log(1 + exp(x))
nn <- neuralnet((Species == "setosa") ~ Petal.Length + Petal.Width, iris, 
                linear.output = FALSE, hidden = c(3, 2), act.fct = softplus)
## Not run: print(nn)
## Not run: plot(nn)





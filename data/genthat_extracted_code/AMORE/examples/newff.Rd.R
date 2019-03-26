library(AMORE)


### Name: newff
### Title: Create a Multilayer Feedforward Neural Network
### Aliases: newff
### Keywords: neural

### ** Examples

#Example 1

library(AMORE)
# P is the input vector
P <- matrix(sample(seq(-1,1,length=1000), 1000, replace=FALSE), ncol=1) 
# The network will try to approximate the target P^2
target <- P^2                                   
# We create a feedforward network, with two hidden layers.
# The first hidden layer has three neurons and the second has two neurons.
# The hidden layers have got Tansig activation functions and the output layer is Purelin.
net <- newff(n.neurons=c(1,3,2,1), learning.rate.global=1e-2, momentum.global=0.5,
        error.criterium="LMS", Stao=NA, hidden.layer="tansig", 
        output.layer="purelin", method="ADAPTgdwm")
result <- train(net, P, target, error.criterium="LMS", report=TRUE, show.step=100, n.shows=5 )
y <- sim(result$net, P)
plot(P,y, col="blue", pch="+")
points(P,target, col="red", pch="x")




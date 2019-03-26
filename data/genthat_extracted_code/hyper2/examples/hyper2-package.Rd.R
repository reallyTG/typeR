library(hyper2)


### Name: hyper2-package
### Title: A generalization of the Dirichlet distribution
### Aliases: hyper2-package hyperdirichlet2
### Keywords: package

### ** Examples

data(chess)
maxp(chess)  # MLE for players' strengths

H <- hyper2(pnames=letters[1:5])

H <- H + order_likelihood(rrank(100,5:1)) # probs = 5/15,4/15,...,1/15
maxp(H)  # should be close to (5:1)/15





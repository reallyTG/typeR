library(Copula.Markov)


### Name: Clayton.Markov2.MLE
### Title: Maximum Likelihood Estimation and Statistical Process Control
###   Under the Clayton Copula with a 2nd order Markov chain.
### Aliases: Clayton.Markov2.MLE
### Keywords: ~kwd1 ~kwd2

### ** Examples

Y = c(0.265, 0.256, 0.261, 0.261, 0.260, 0.257, 0.258, 0.263, 0.254, 0.254, 
      0.258, 0.256, 0.256, 0.265, 0.270, 0.267, 0.270, 0.267, 0.266, 0.271, 
      0.270, 0.264, 0.261, 0.264, 0.266, 0.264, 0.269, 0.268, 0.264, 0.262, 
      0.257, 0.255, 0.255, 0.253, 0.251, 0.254, 0.255)
Clayton.Markov2.MLE(Y, k = 1, D = 1, plot = TRUE)

Y=Clayton.Markov2.DATA(n=1000,mu=0,sigma=1,alpha=8)
Clayton.Markov2.MLE(Y, plot=TRUE)




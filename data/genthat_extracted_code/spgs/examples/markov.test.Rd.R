library(spgs)


### Name: markov.test
### Title: A Test for First-Order Markovianness
### Aliases: markov.test
### Keywords: htest

### ** Examples

#Generate an IID uniform DNA sequence
seq <- simulateMarkovChain(5000, matrix(0.25, 4, 4), states=c("a","c","g","t"))
markov.test(seq)




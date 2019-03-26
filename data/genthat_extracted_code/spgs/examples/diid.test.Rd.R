library(spgs)


### Name: diid.test
### Title: A Test for a Bernoulli Scheme (IID Sequence)
### Aliases: diid.test
### Keywords: htest

### ** Examples

#Generate an IID uniform DNA sequence
seq <- simulateMarkovChain(5000, matrix(0.25, 4, 4), states=c("a","c","g","t"))
diid.test(seq)




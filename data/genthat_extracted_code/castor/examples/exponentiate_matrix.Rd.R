library(castor)


### Name: exponentiate_matrix
### Title: Exponentiate a matrix.
### Aliases: exponentiate_matrix
### Keywords: algebra exponential

### ** Examples

# create a random 5 x 5 matrix
A = get_random_mk_transition_matrix(Nstates=5, rate_model="ER")

# calculate exponentials exp(0.1*A) and exp(10*A)
exponentials = exponentiate_matrix(A, scalings=c(0.1,10))

# print 1st exponential: exp(0.1*A)
print(exponentials[,,1])

# print 2nd exponential: exp(10*A)
print(exponentials[,,2])




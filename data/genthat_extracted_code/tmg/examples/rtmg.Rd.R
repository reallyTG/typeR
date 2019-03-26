library(tmg)


### Name: rtmg
### Title: Sample from truncated multivariate Gaussians
### Aliases: rtmg
### Keywords: distribution

### ** Examples

# Set number of samples
n=15000;

#Define precision matrix and linear term 
M = matrix(c(.5,-.4, -.4,.5), 2,2)
r = c(0,0)

# Set initial point for the Markov chain
initial = c(4,1)

# Define two linear constraints
f = diag(2)
f[1,2] = 1
g = c(0,0)

# Define two quadratic constraints
A1 = matrix(c(-1/8,0,0,-1/2),2,2)
B1 = c(.5,.5)
C1 = 3/4
constr1 = list(A1,B1,C1)

A2 = matrix(c(4,-1,-1,8),2,2)
B2 = c(0,5)
C2 = -1
constr2 = list(A2,B2,C2)

q = list(constr1,constr2)

# Sample and plot
samples = rtmg(n, M, r, initial, f,g, q); 
plot(samples, pch=".")





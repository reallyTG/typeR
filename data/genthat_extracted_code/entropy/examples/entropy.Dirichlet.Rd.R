library(entropy)


### Name: entropy.Dirichlet
### Title: Dirichlet Prior Bayesian Estimators of Entropy, Mutual
###   Information and Other Related Quantities
### Aliases: freqs.Dirichlet entropy.Dirichlet KL.Dirichlet chi2.Dirichlet
###   mi.Dirichlet chi2indep.Dirichlet
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")


# a single variable

# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)  

# Dirichlet estimate of frequencies with a=1/2
freqs.Dirichlet(y, a=1/2)

# Dirichlet estimate of entropy with a=0
entropy.Dirichlet(y, a=0)

# identical to empirical estimate
entropy.empirical(y)

# Dirichlet estimate with a=1/2 (Jeffreys' prior)
entropy.Dirichlet(y, a=1/2)

# Dirichlet estimate with a=1 (Laplace prior)
entropy.Dirichlet(y, a=1)

# Dirichlet estimate with a=1/length(y)
entropy.Dirichlet(y, a=1/length(y))

# Dirichlet estimate with a=sqrt(sum(y))/length(y)
entropy.Dirichlet(y, a=sqrt(sum(y))/length(y))


# example with two variables

# observed counts for two random variables
y1 = c(4, 2, 3, 1, 10, 4)
y2 = c(2, 3, 7, 1, 4, 3)

# Bayesian estimate of Kullback-Leibler divergence (a=1/6)
KL.Dirichlet(y1, y2, a1=1/6, a2=1/6)

# half of the corresponding chi-squared statistic
0.5*chi2.Dirichlet(y1, y2, a1=1/6, a2=1/6)


## joint distribution example

# contingency table with counts for two discrete variables
y2d = rbind( c(1,2,3), c(6,5,4) )

# Bayesian estimate of mutual information (a=1/6)
mi.Dirichlet(y2d, a=1/6)

# half of the Bayesian chi-squared statistic of independence
0.5*chi2indep.Dirichlet(y2d, a=1/6)






library(miceadds)


### Name: fleishman_sim
### Title: Simulating Univariate Data from Fleishman Power Normal
###   Transformations
### Aliases: fleishman_sim fleishman_coef

### ** Examples

#############################################################################
# EXAMPLE 1: Simulating values with Fleishman polynomial
#############################################################################

#* define mean, standard deviation, skewness and kurtosis
mean <- .75
sd <- 2
skew <- 1
kurt <- 3

#* compute coefficients of Fleishman polynomial
coeff <- miceadds::fleishman_coef(mean=mean, sd=sd, skew=skew, kurt=kurt)
print(coeff)

# sample size
N <- 1000
set.seed(2018)
#* simulate values based on estimated coefficients
X <- miceadds::fleishman_sim(N=N, coef=coeff)
#* simulate values based on input of moments
X <- miceadds::fleishman_sim(N=N, mean=mean, sd=sd, skew=skew, kurt=kurt)




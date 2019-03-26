library(bayescount)


### Name: likelihood
### Title: Calculate the (Log) Likelihood of Obtaining Data from a
###   Distribution
### Aliases: likelihood
### Keywords: models

### ** Examples


# calculate the likelihood of obtaining a set of count data from 
# a zero-inflated Poisson distribution with set mean and zero-inflation 
# values

data <- rpois(100, 10)
data[1:15] <- 0

likelihood('ZIP', data, mean=10, zi=15)

# now calculate the likelihood for the same data using an MCMC object 
# to provide the values for mean and zero-inflation

## Not run: 
##D values <- bayescount.single(data, model='ZISP', raw.output=TRUE)$mcmc
##D means <- c(values[,'mean'][[1]], values[,'mean'][[2]])
##D zis <- (1-c(values[,'prob'][[1]], values[,'prob'][[2]]))*100 
##D # The function outputs the prevalence of disease when raw.ouput is 
##D # TRUE, so zero-inflation must be calculated from this
##D 
##D likes <- likelihood('ZIP', data, mean=means, zi=zis, 
##D raw.output=TRUE)$likelihood
##D hist(likes, breaks='fd', col='red')
## End(Not run)





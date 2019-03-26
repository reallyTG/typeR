library(l2boost)


### Name: mvnorm.l2boost
### Title: multivariate normal data simulations.
### Aliases: mvnorm.l2boost

### ** Examples

#--------------------------------------------------------------------------
# Example: Multivariate normal data simulation

# Create a (reproducable) data set of size 100 x 100
set.seed(1024)
n<- 100
p<- 100

# Set 10 signal variables using a uniform beta=5, the remaining (p-10)=90 are
# set to zero indicating random noise.  
beta <- c(rep(5,10), rep(0,p-10))

# Example with orthogonal design matrix columns (orthogonal + noise)
ortho.data <- mvnorm.l2boost(n, p, beta)
cbind(ortho.data$y[1:5],ortho.data$x[1:5,])

# Example with correlation between design matrix columns
corr.data <- mvnorm.l2boost(n, p, beta, rho=0.65)
cbind(corr.data$y[1:5],corr.data$x[1:5,])






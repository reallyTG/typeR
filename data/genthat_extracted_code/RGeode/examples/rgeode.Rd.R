library(RGeode)


### Name: rgeode
### Title: GEOmetric Density Estimation.
### Aliases: rgeode

### ** Examples


library(MASS)
library(RGeode)

####################################################################
# WITHOUT MISSING DATA
####################################################################
# Define the dataset
D= 200
n= 500
d= 10
d_true= 3

set.seed(321)

mu_true= runif(d_true, -3, 10)

Sigma_true= matrix(0,d_true,d_true)
diag(Sigma_true)= c(runif(d_true, 10, 100))

W_true = svd(matrix(rnorm(D*d_true, 0, 1), d_true, D))$v

sigma_true = abs(runif(1,0,1))

mu= W_true%*%mu_true
C= W_true %*% Sigma_true %*% t(W_true)+ sigma_true* diag(D)

y= mvrnorm(n, mu, C)

################################
# GEODE: Without missing data
################################

start.time <- Sys.time() 
GEODE= rgeode(Y= y, d)
Sys.time()- start.time

# SIGMAS
#plot(seq(110,3000,by=1),GEODE$sigmaS[110:3000],ty='l',col=2,
#     xlab= 'Iteration', ylab= 'sigma^2', main= 'Simulation of sigma^2')
#abline(v=800,lwd= 2, col= 'blue')
#legend('bottomright',c('Posterior of sigma^2', 'Stopping time'),
#       lwd=c(1,2),col=c(2,4),cex=0.55, border='black', box.lwd=3)
       
       
####################################################################
# WITH MISSING DATA
####################################################################

###########################
#Insert NaN
n_m = 5 #number of data vectors containing missing features
d_m = 1  #number of missing features

data_miss= sample(seq(1,n),n_m)

features= sample(seq(1,D), d_m)
for(i in 2:n_m)
{
  features= rbind(features, sample(seq(1,D), d_m))
}

for(i in 1:length(data_miss))
{
  
  if(i==length(data_miss))
  {
    y[data_miss[i],features[i,][-1]]= NaN
  }
  else
  {
    y[data_miss[i],features[i,]]= NaN
  }
  
}

################################
# GEODE: With missing data
################################
set.seed(321)
start.time <- Sys.time() 
GEODE= rgeode(Y= y, d)
Sys.time()- start.time

# SIGMAS
#plot(seq(110,3000,by=1),GEODE$sigmaS[110:3000],ty='l',col=2,
#     xlab= 'Iteration', ylab= 'sigma^2', main= 'Simulation of sigma^2')
#abline(v=800,lwd= 2, col= 'blue')
#legend('bottomright',c('Posterior of sigma^2', 'Stopping time'),
#       lwd=c(1,2),col=c(2,4),cex=0.55, border='black', box.lwd=3)



####################################################################
####################################################################




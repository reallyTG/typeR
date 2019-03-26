library(samplesize4surveys)


### Name: ss2s4m
### Title: Sample Sizes in Two-Stage sampling Designs for Estimating Signle
###   Means
### Aliases: ss2s4m

### ** Examples


ss2s4m(N=100000, mu=10, sigma=2, conf=0.95, rme=0.03, M=50, by=5, rho=0.01)
ss2s4m(N=100000, mu=10, sigma=2, conf=0.95, rme=0.03, M=50, by=5, rho=0.1)
ss2s4m(N=100000, mu=10, sigma=2, conf=0.95, rme=0.03, M=50, by=5, rho=0.2)
ss2s4m(N=100000, mu=10, sigma=2, conf=0.95, rme=0.05, M=50, by=5, rho=0.3)

##########################################
# Almost same mean in each cluster       #
#                                        #
# - Heterogeneity within clusters        #
# - Homogeinity between clusters         #
#                                        #
#  Decision rule:                        #
#    * Select a lot of units per cluster #
#    * Select a few of clusters          #
##########################################

# Population size
N <- 1000000
# Number of clusters in the population
NI <- 1000
# Number of elements per cluster
N/NI

# The variable of interest
y <- c(1:N)
# The clustering factor
cl <- rep(1:NI, length.out=N)

rho = ICC(y,cl)$ICC
rho

ss2s4m(N, mu=mean(y), sigma=sd(y), conf=0.95, rme=0.03, M=N/NI, by=10, rho)


##########################################
# Very different means per cluster       #
#                                        #
# - Heterogeneity between clusters       #
# - Homogeinity within clusters          #
#                                        #
#  Decision rule:                        #
#    * Select a few of units per cluster #
#    * Select a lot of clusters          #
##########################################

# Population size
N <- 1000000
# Number of clusters in the population
NI <- 1000
# Number of elements per cluster
N/NI

# The variable of interest
y <- c(1:N)
# The clustering factor
cl <- kronecker(c(1:NI),rep(1,N/NI))

rho = ICC(y,cl)$ICC
rho

ss2s4m(N, mu=mean(y), sigma=sd(y), conf=0.95, rme=0.03, M=N/NI, by=10, rho)




library(HMMpa)


### Name: HMM_simulation
### Title: Generating Realizations of a Hidden Markov Model
### Aliases: HMM_simulation
### Keywords: ~kwd1 ~kwd2

### ** Examples


################################################################
### i.) Generating a HMM with Poisson-distributed data #########
################################################################
## No test: 
Pois_HMM_data <- 
   HMM_simulation(size = 300, 
      m = 5, 
      distribution_class = "pois", 
      distribution_theta = list( lambda=c(10,15,25,35,55)))

print(Pois_HMM_data)
## End(No test)
################################################################
### ii.) Generating 6 physical activities with normally ########
###      distributed accelerometer counts using a HMM. #########
################################################################

## Define number of time points (1440 counts equal 6 hours of 
## activity counts assuming an epoch length of 15 seconds).
size <- 1440

## Define 6 possible physical activity ranges
m <- 6

## Start with the lowest possible state 
## (in this case with the lowest physical activity)
delta <- c(1, rep(0, times = (m - 1)))

## Define transition matrix to generate according to a 
## specific activity 
gamma <- 0.935 * diag(m) + rep(0.065 / m, times = m)

## Define parameters 
## (here: means and standard deviations for m=6 normal 
##  distributions that define the distribution in 
##  a phsycial acitivity level)
distribution_theta <- list(mean = c(0,100,400,600,900,1200), 
   sd = rep(x = 200, times = 6))

### Assume for each count an upper boundary of 2000
obs_range <-c(NA,2000)

### Accelerometer counts shall not be negative
obs_non_neg <-TRUE

### Start simulation
## No test: 
accelerometer_data <- 
   HMM_simulation(size = size, 
     m = m, 
     delta = delta, 
     gamma = gamma, 
     distribution_class = "norm", 
     distribution_theta = distribution_theta, 
     obs_range = obs_range, 
     obs_non_neg= obs_non_neg, plotting=0)

print(accelerometer_data)
## End(No test)



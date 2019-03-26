library(acc)


### Name: acc
### Title: Summarizes accelerometer data for multiple types of physical
###   activities
### Aliases: acc
### Keywords: accelerometer

### ** Examples

##
## Example: Loading accelerometer counts data using readCounts function
##      
## Not run: 
##D library(acc)
##D infile <- "CountsDataName.dat"
##D counts <- readCounts(infile)
##D 
##D 
##D ##
##D ## Example: Summarizing accelerometer data for a sedentary individual
##D ##        
##D 
##D # For this example, data is generated using a Hidden Markov model
##D # First, a sequence of time is generated
##D randomTime <- seq(ISOdate(2015,4,1),ISOdate(2015,4,3),"min")
##D # Load the mhsmm package to generate data using a Hidden Makov model
##D library(mhsmm)
##D # It is assumed that the counts are generated from a Hidden Markov model 
##D # with three states being non-wear, sedentary, and moderate-vigorous activity
##D J <- 3; initial <- rep(1/J, J)
##D # Set up a transition matrix for the Hidden Markov model.
##D P <- matrix(c(0.95, 0.04, 0.01, 
##D              0.09, 0.9, 0.01, 
##D              0.1, 0.2, 0.7), byrow='TRUE',nrow = J)
##D # It is assumed that the counts are realized from a mixture of
##D # two normal distributions (for sedentary activity and mvpa) 
##D # and a constant at zero (for non-wear time).
##D b <- list(mu = c(0, 30, 2500), sigma = c(0, 30, 1000))
##D model <- hmmspec(init = initial, trans = P, parms.emission = b,dens.emission = dnorm.hsmm)
##D # Generate data!
##D train <- simulate.hmmspec(model, nsim = (60*24*2), seed = 1234, rand.emis = rnorm.hsmm)
##D # Now set up a dataset that mimicks the accelerometry data
##D counts <- data.frame(TimeStamp = randomTime[1:length(train$x)], counts = train$x)
##D library(acc)
##D # summarize the data using the acc function.
##D # Sedentary and moderate-vigorous activity is summarized, using Freedson's cut points by default.
##D summary1 <- acc(data=counts, tri='FALSE', axis=NULL,
##D                      spuriousDef=20, nonwearDef=60, minWear=600, 
##D                      patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)), 
##D                      boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
##D summary1  
##D 
##D 
##D ##
##D ## Example: Summarizing accelerometer data for an active individual.
##D ##
##D 
##D randomTime <- seq(ISOdate(2015,4,1),ISOdate(2015,4,3),"min")
##D library(mhsmm)
##D J <- 3; initial <- rep(1/J, J)
##D P <- matrix(c(0.95, 0.04, 0.01, 
##D              0.09, 0.7, 0.21, 
##D              0.1, 0.1, 0.8), byrow='TRUE',nrow = J)
##D b <- list(mu = c(0, 30, 2500), sigma = c(0, 30, 1000))
##D model <- hmmspec(init = initial, trans = P, parms.emission = b,dens.emission = dnorm.hsmm)
##D train <- simulate.hmmspec(model, nsim = (60*24*2), seed = 1234, rand.emission = rnorm.hsmm)
##D 
##D counts <- data.frame(TimeStamp = randomTime[1:length(train$x)], counts = train$x)
##D library(acc)
##D summary2 <- acc(data=counts, tri='FALSE', axis=NULL,
##D                      spuriousDef=20, nonwearDef=60, minWear=600, 
##D                      patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)), 
##D                      boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
##D summary2
##D 
## End(Not run)




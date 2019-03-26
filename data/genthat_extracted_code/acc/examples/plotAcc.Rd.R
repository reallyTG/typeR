library(acc)


### Name: plotAcc
### Title: Plots accelerometer data
### Aliases: plotAcc
### Keywords: accelerometer

### ** Examples

## Not run: 
##D ##
##D ## Example: Simulate a dataset for two days, for an individual with low MVPA level.
##D ##
##D mvpaLowData <- simAcc(timelength=(60*24*2),paLevel='low')
##D summary <- accSummary(data=mvpaLowData)
##D summary$validDates
##D plotAcc(summary,markbouts='FALSE')
##D 
##D ##
##D ## Example: Simulate a dataset for two days, for an individual with moderate MVPA level.
##D ##
##D mvpaModData <- simAcc(timelength=(60*24*2),paLevel='moderate')
##D summary <- accSummary(data=mvpaModData, tri='FALSE', axis=NULL,
##D              spuriousDef=20, nonwearDef=60, minWear=600, 
##D              patype='MVPA',pacut=c(1952,Inf), boutsize=10, 
##D              tolerance='TRUE', returnbout='TRUE')
##D summary$validDates
##D plotAcc(summary,markbouts='FALSE')
##D 
##D ##
##D ## Example: Simulate a dataset for two days, for an individual with high MVPA level.
##D ##
##D mvpaHighData <- simAcc(timelength=(60*24*2),paLevel='high')
##D summary <- accSummary(data=mvpaHighData, tri='FALSE', axis=NULL,
##D              spuriousDef=20, nonwearDef=60, minWear=600, 
##D              patype='MVPA',pacut=c(1952,Inf), boutsize=10, 
##D              tolerance='TRUE', returnbout='TRUE')
##D summary$validDates
##D plotAcc(summary,markbouts='FALSE')
##D 
##D 
##D ##
##D ## Example: Simulate a tri-axial dataset for five days.
##D ##
##D   library(acc)
##D   library(mhsmm)
##D   seedset=1234
##D   minutes=(60*24*5)
##D   randomTime <- seq(ISOdate(2015,1,1),ISOdate(2020,1,1),"min")
##D   J <- 3; initial <- rep(1/J, J)
##D   P <- matrix(rep(NA,9),byrow='TRUE',nrow=J)
##D 
##D   P1 <- matrix(c(0.95, 0.04, 0.01, 
##D                   0.09, 0.9, 0.01, 
##D                   0.1, 0.2, 0.7), byrow='TRUE',nrow = J)
##D 
##D   b <- list(mu = c(0, 30, 2500), sigma = c(0, 30, 1000))
##D   model1 <- hmmspec(init = initial, trans = P1, parms.emis = b,dens.emis = dnorm.hsmm)
##D   x <- simulate.hmmspec(model1, nsim = (minutes), seed = seedset, rand.emis = rnorm.hsmm)
##D 
##D   seedset=12345
##D   P2 <- matrix(c(0.95, 0.04, 0.01, 
##D                   0.09, 0.8, 0.11, 
##D                   0.1, 0.1, 0.8), byrow='TRUE',nrow = J)
##D   model2 <- hmmspec(init = initial, trans = P2, parms.emis = b,dens.emis = dnorm.hsmm)
##D   y <- simulate.hmmspec(model2, nsim = (minutes), seed = seedset, rand.emis = rnorm.hsmm)
##D 
##D   seedset=123456
##D   P3 <- matrix(c(0.95, 0.04, 0.01, 
##D                   0.09, 0.8, 0.11, 
##D                   0.1, 0.1, 0.8), byrow='TRUE',nrow = J)
##D   model3 <- hmmspec(init = initial, trans = P3, parms.emis = b,dens.emis = dnorm.hsmm)
##D   z <- simulate.hmmspec(model3, nsim = (minutes), seed = seedset, rand.emis = rnorm.hsmm)
##D 
##D   counts <- data.frame(TimeStamp = randomTime[1:minutes], x=x$x, y=y$x, z=z$x)
##D   summary <- accSummary(data=counts, tri='TRUE', axis='vm',
##D                         spuriousDef=20, nonwearDef=60, minWear=600, 
##D                         patype='MVPA',pacut=c(1952,Inf), boutsize=10, tolerance='TRUE',
##D                         returnbout='TRUE')
##D summary$validDates
##D 
##D plotAcc(summary,markbouts='FALSE')
## End(Not run)





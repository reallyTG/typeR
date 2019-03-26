library(DIME)


### Name: nudge.plot.mix
### Title: Plot NUDGE Mixture Component Function
### Aliases: nudge.plot.mix
### Keywords: aplot dplot

### ** Examples

library(DIME);
# generate simulated datasets with underlying uniform and 1-normal components
set.seed(1234);
N1 <- 1500; N2 <- 500; rmu <- c(1.5); rsigma <- c(1); 
rpi <- c(.10,.90); a <- (-6); b <- 6; 
chr1 <- c(-runif(ceiling(rpi[1]*N1),min = a,max =b),
  rnorm(ceiling(rpi[2]*N1),rmu[1],rsigma[1]));
chr4 <- c(-runif(ceiling(rpi[1]*N2),min = a,max =b),
  rnorm(ceiling(rpi[2]*N2),rmu[1],rsigma[1]));  
# analyzing chromosome 1 and 4
data <- list(chr1,chr4);

# fit NUDGE model with maximum iterations = 20 only
bestNudge <- nudge.fit(data, max.iter=20);

# plot estimated iNUDGE model imposed on the histogram of observed data
hist(unlist(data),freq=FALSE,breaks=40);
nudge.plot.mix(bestNudge,resolution=1000,new.plot=FALSE,col="red");





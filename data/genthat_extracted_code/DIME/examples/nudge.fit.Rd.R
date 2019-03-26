library(DIME)


### Name: nudge.fit
### Title: Function for Fitting NUDGE model parameters
### Aliases: nudge.fit
### Keywords: models

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
set.seed(1234);
bestNudge <- nudge.fit(data, max.iter=20);

# Getting the best fitted NUDGE model (parameters)
bestNudge$pi # estimated proportion of each component in NUDGE
bestNudge$mu # estimated mean of the normal component(s) in NUDGE
# estimated standard deviation of the normal component(s) in NUDGE
bestNudge$sigma 




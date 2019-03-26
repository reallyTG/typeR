library(DIME)


### Name: inudge.plot.fit
### Title: Plot iNUDGE Goodness of Fit
### Aliases: inudge.plot.fit
### Keywords: aplot dplot

### ** Examples

library(DIME);
# generate simulated datasets with underlying uniform and 2-normal distributions
set.seed(1234);
N1 <- 1500; N2 <- 500; rmu <- c(-2.25,1.5); rsigma <- c(1,1); 
rpi <- c(.10,.45,.45); a <- (-6); b <- 6; 
chr4 <- list(c(-runif(ceiling(rpi[1]*N1),min = a,max =b),
  rnorm(ceiling(rpi[2]*N1),rmu[1],rsigma[1]), 
  rnorm(ceiling(rpi[3]*N1),rmu[2],rsigma[2])));
chr9 <- list(c(-runif(ceiling(rpi[1]*N2),min = a,max =b),
  rnorm(ceiling(rpi[2]*N2),rmu[1],rsigma[1]), 
  rnorm(ceiling(rpi[3]*N2),rmu[2],rsigma[2])));
# analyzing chromosome 4 and 9
data <- list(chr4,chr9);

# fit iNUDGE model with 2-normal components and maximum iterations = 20
set.seed(1234);
bestInudge <- inudge.fit(data, K = 2, max.iter=20);

# Goodness of fit plot
inudge.plot.fit(data,bestInudge,legpos=c(-6,0.3),ylim=c(0,0.3),breaks=40);





library(DIME)


### Name: DIME
### Title: DIME (Differential Identification using Mixtures Ensemble)
### Aliases: DIME DIME
### Keywords: methods

### ** Examples

library(DIME)
# generate simulated datasets with underlying exponential-normal components
N1 <- 1500; N2 <- 500; K <- 4; rmu <- c(-2.25,1.50); rsigma <- c(1,1); 
rpi <- c(.05,.45,.45,.05); rbeta <- c(12,10);
set.seed(1234)
chr1 <- c(-rgamma(ceiling(rpi[1]*N1),shape = 1,scale = rbeta[1]), 
  rnorm(ceiling(rpi[2]*N1),rmu[1],rsigma[1]), 
  rnorm(ceiling(rpi[3]*N1),rmu[2],rsigma[2]), 
  rgamma(ceiling(rpi[4]*N1),shape = 1,scale = rbeta[2]));
chr2 <- c(-rgamma(ceiling(rpi[1]*N2),shape = 1,scale = rbeta[1]), 
  rnorm(ceiling(rpi[2]*N2),rmu[1],rsigma[1]), 
  rnorm(ceiling(rpi[3]*N2),rmu[2],rsigma[2]), 
  rgamma(ceiling(rpi[4]*N2),shape = 1,scale = rbeta[2])); 
chr3 <- c(-rgamma(ceiling(rpi[1]*N2),shape = 1,scale = rbeta[1]), 
  rnorm(ceiling(rpi[2]*N2),rmu[1],rsigma[1]), 
  rnorm(ceiling(rpi[3]*N2),rmu[2],rsigma[2]), 
  rgamma(ceiling(rpi[4]*N2),shape = 1,scale = rbeta[2]));
# analyzing only chromosome 1 and chromosome 3
data <- list(chr1,chr3);

# run DIME
set.seed(1234)
test <- DIME(data,gng.max.iter=10,gng.rep=1,inudge.max.iter=10,inudge.rep=1,
 nudge.max.iter=10,nudge.rep=1)

# Getting the best fitted model (parameters)
test$best$name # name of the best fitted model
test$best$pi # estimated proportion of each component in the best model
test$best$mu # estimated mean of the normal component(s) the best model
# estimated standard deviation of the normal component(s) in best model
test$best$sigma 
# estimated shape parameter of the exponential components in best model  
test$best$beta
# class indicator inferred using best model chosen. 1 means differential, 0 o.w
bestClass = test$best$class 

# plot best model
DIME.plot.fit(data,test)

# Eg. getting Gaussian mean from iNUDGE model
test$inudge$mu

# Eg. getting Gaussian mean from NUDGE model
test$nudge$mu

# Eg. getting parameters from GNG model
test$gng$mu

# provide initial estimates means of Gaussian in GNG model
test <- DIME(data,gng.max.iter=5,gng.rep=1,inudge.max.iter=5,inudge.rep=1,
 nudge.max.iter=5,nudge.rep=1,gng.K=2,gng.mu=rbind(c(1,2)))




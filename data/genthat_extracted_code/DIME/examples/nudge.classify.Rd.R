library(DIME)


### Name: nudge.classify
### Title: Classification Based on NUDGE Model
### Aliases: nudge.classify
### Keywords: methods

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
test <- nudge.fit(data, max.iter=20)
# vector of classification. 1 represents differential, 0 denotes non-differential
nudgeClass <- test$class;




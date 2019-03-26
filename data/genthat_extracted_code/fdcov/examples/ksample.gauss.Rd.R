library(fdcov)


### Name: ksample.gauss
### Title: k-sample test for equality of covariance operators
### Aliases: ksample.gauss

### ** Examples

# Load in phoneme data
library(fds)
# Set up test data
dat1 = t(aa$y)[1:20,];
dat2 = t(sh$y)[1:20,];
dat3 = t(aa$y)[21:40,];
# Compare two disimilar phonemes
# Resulting in a small p-value
ksample.gauss(dat1,dat2,K=5);
ksample.vstab(dat1,dat2,K=5);
# Compare two sets of the same phonemes
# Resulting in a large p-value
ksample.gauss(dat1,dat3,K=5);
ksample.vstab(dat1,dat3,K=5);




library(plRasch)


### Name: simRasch
### Title: Simulate a data matrix from the Rasch Model
### Aliases: simRasch
### Keywords: misc models

### ** Examples

NCAT <- 2;
NITEM <- 4;
NEXAMINEE <- 50;
BETA <- c(-1, 0, 0.5, 1)
set.seed(1);
rasch.sim <- simRasch(ncat=NCAT, nitem=NITEM, nexaminee=NEXAMINEE, beta=BETA)




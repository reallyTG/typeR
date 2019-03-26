library(plRasch)


### Name: llla
### Title: Fit Log Linear by Linear Association Models
### Aliases: llla
### Keywords: models

### ** Examples

NCAT <- 2;
NITEM <- 4;
NEXAMINEE <- 50;
BETA <- c(-1, 0, 0.5, 1)
set.seed(1);
rasch.sim <- simRasch(ncat=NCAT, nitem=NITEM, nexaminee=NEXAMINEE, beta=BETA)
sim.data <- rasch.sim$data
colnames(sim.data) <- paste("I", 1:NITEM, sep='')

## The model item adjacency matrix and the latent trait adjacency matrix
item.mtx <- rep(1, NITEM);
trait.mtx <- 1;

### MLE of log-multiplicative Assoc. Model
mlfit <- llla(sim.data, item.mtx, trait.mtx, useMLE=TRUE)
mlfit

#### PLE of log-multiplicative Assoc. Model
plfit <- llla(sim.data, item.mtx, trait.mtx)
plfit





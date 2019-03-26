library(plRasch)


### Name: RaschPLE
### Title: Fit Rasch Family Models Using Pseudolikelihood Esitmation
### Aliases: RaschPLE
### Keywords: models models

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

plfit.rasch <- RaschPLE(sim.data, item.mtx, trait.mtx)
plfit.rasch 




library(PP)


### Name: sim_4pl
### Title: Simulate data for 1/2/3/4-pl model
### Aliases: sim_4pl

### ** Examples

################# simulate 4PL ###############################################

set.seed(1700)
 
# simulate 1-PL model ----------

thetas <- c(0.231,-1.313,1.772,1.601,1.733,-2.001,0.443,3.111,-4.156)
sl <- c(1,1.1,0.9,0.89,1.5,1.1,1)
la <- c(0,0,0.2,0.15,0.04,0,0.21)
ua <- c(0.9,0.98,0.97,1,1,1,0.97)

simdat1pl <- sim_4pl(beta=seq(-4,4,length.out=7), alpha=rep(1,7),
                  lowerA=rep(0,7), upperA=rep(1,7), theta=thetas)


head(simdat1pl)


# simulate 2-PL model ----------

simdat2pl <- sim_4pl(beta=seq(-4,4,length.out=7), alpha=sl,
                  lowerA=rep(0,7), upperA=rep(1,7), theta=thetas)


head(simdat2pl)


# simulate 3-PL model ----------

simdat3pl <- sim_4pl(beta=seq(-4,4,length.out=7), alpha=sl,
                     lowerA=la, upperA=rep(1,7), theta=thetas)


head(simdat3pl)


# simulate 4-PL model ----------

simdat4pl <- sim_4pl(beta=seq(-4,4,length.out=7), alpha=sl,
                     lowerA=la, upperA=ua, theta=thetas)


head(simdat4pl)





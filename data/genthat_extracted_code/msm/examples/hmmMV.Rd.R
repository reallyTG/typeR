library(msm)


### Name: hmmMV
### Title: Multivariate hidden Markov models
### Aliases: hmmMV
### Keywords: distribution

### ** Examples

## Simulate data from a Markov model 
nsubj <- 30; nobspt <- 5
sim.df <- data.frame(subject = rep(1:nsubj, each=nobspt),
                     time = seq(0, 20, length=nobspt))
set.seed(1)
two.q <- rbind(c(-0.1, 0.1), c(0, 0))
dat <- simmulti.msm(sim.df[,1:2], qmatrix=two.q, drop.absorb=FALSE)

### EXAMPLE 1
## Generate two observations at each time from the same outcome
## distribution:
## Bin(40, 0.1) for state 1, Bin(40, 0.5) for state 2
dat$obs1[dat$state==1] <- rbinom(sum(dat$state==1), 40, 0.1)
dat$obs2[dat$state==1] <- rbinom(sum(dat$state==1), 40, 0.1)
dat$obs1[dat$state==2] <- rbinom(sum(dat$state==2), 40, 0.5)
dat$obs2[dat$state==2] <- rbinom(sum(dat$state==2), 40, 0.5)
dat$obs <- cbind(obs1 = dat$obs1, obs2 = dat$obs2)

## Fitted model should approximately recover true parameters 
msm(obs ~ time, subject=subject, data=dat, qmatrix=two.q,
    hmodel = list(hmmBinom(size=40, prob=0.2),
                  hmmBinom(size=40, prob=0.2)))

### EXAMPLE 2
## Generate two observations at each time from different
## outcome distributions:
## Bin(40, 0.1) and Bin(40, 0.2) for state 1, 
dat$obs1 <- dat$obs2 <- NA
dat$obs1[dat$state==1] <- rbinom(sum(dat$state==1), 40, 0.1)
dat$obs2[dat$state==1] <- rbinom(sum(dat$state==1), 40, 0.2)

## Bin(40, 0.5) and Bin(40, 0.6) for state 2
dat$obs1[dat$state==2] <- rbinom(sum(dat$state==2), 40, 0.6)
dat$obs2[dat$state==2] <- rbinom(sum(dat$state==2), 40, 0.5)
dat$obs <- cbind(obs1 = dat$obs1, obs2 = dat$obs2)

## Fitted model should approximately recover true parameters 
msm(obs ~ time, subject=subject, data=dat, qmatrix=two.q,   
    hmodel = list(hmmMV(hmmBinom(size=40, prob=0.3),
                        hmmBinom(size=40, prob=0.3)),                 
                 hmmMV(hmmBinom(size=40, prob=0.3),
                       hmmBinom(size=40, prob=0.3))),
    control=list(maxit=10000))




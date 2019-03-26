library(goric)


### Name: sim
### Title: Simulation from order restricted linear models
### Aliases: sim sim.orlm sim.orgls
### Keywords: methods

### ** Examples

########################
## Artificial example ##
########################
n <- 10
m <- c(1,1,2)
dat <- data.frame(grp=as.factor(rep(1:length(m), each=n)),
                  y=rnorm(n*length(m), rep(m, each=n), 1))
cm <- rbind(c(-1,1,0),
            c(0,-1,1))
fm <- orlm(y ~ grp-1, data=dat, constr=cm, rhs=rep(0,nrow(cm)), nec=0)
b <- sim(fm, n.sims=1000)$coef
pairs(t(b), cex=0.3)




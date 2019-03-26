library(goric)


### Name: orlmSet
### Title: Set of multivariate regression models
### Aliases: orlmSet
### Keywords: models

### ** Examples

########################
## Artificial example ##
########################

n <- 10
m <- c(1,2,4,5,2,1)
nm <- length(m)
dat <- data.frame(grp=as.factor(rep(1:nm, each=n)),
                  y=rnorm(n*nm, rep(m, each=n), 1))

(cs <- constrSet(table(dat$grp), set="sequence"))
(oss <- orlmSet(y ~ grp-1, data=dat, set=cs))

# the same as:
oss <- orlmSet(y ~ grp-1, data=dat, set="sequence")




library(HiddenMarkov)


### Name: Mstep
### Title: M-Step of EM Algorithm for DTHMM
### Aliases: Mstep Mstep.beta Mstep.binom Mstep.exp Mstep.gamma Mstep.glm
###   Mstep.lnorm Mstep.logis Mstep.norm Mstep.pois
### Keywords: optimize

### ** Examples

#    Fit logistic distribution to a simple single sample

#    Simulate data
n <- 20000
location <- -2
scale <- 1.5

x <- rlogis(n, location, scale)

#    give each datum equal weight
cond <- NULL
cond$u <- matrix(rep(1/n, n), ncol=1)

#    calculate maximum likelihood parameter estimates
#    start iterations at values used to simulate
print(Mstep.logis(x, cond,
                  pm=list(location=location,
                          scale=scale)))

#-----------------------------------------------------
#   Example with Gaussian Observations
#   Assume that both mean and sd are Markov dependent, but the means
#   are known and sd requires estimation (See "Modifications" above).
#   One way is to define a new distribution called "xyz", say.

Mstep.xyz <- function(x, cond, pm, pn){
    #   this function is a modified version of Mstep.norm
    #   here the mean is fixed to the values specified in pm$mean
    nms <- sort(names(pm))
    n <- length(x)
    m <- ncol(cond$u)
    if (all(nms==c("mean", "sd"))){
        mean <- pm$mean
        sd <- sqrt(apply((matrix(x, nrow=n, ncol=m) - 
                   matrix(mean,
                   nrow=n, ncol=m, byrow=TRUE))^2 * cond$u, MARGIN=2,
                   FUN=sum)/apply(cond$u, MARGIN=2, FUN=sum))
        return(list(mean=mean, sd=sd))
    }
}

#   define the distribution related functions for "xyz"
#   they are the same as those for the Normal distribution
rxyz <- rnorm
dxyz <- dnorm
pxyz <- pnorm
qxyz <- qnorm

Pi <- matrix(c(1/2, 1/2,   0,
               1/3, 1/3, 1/3,
                 0, 1/2, 1/2),
             byrow=TRUE, nrow=3)
p1 <- c(1, 6, 3)
p2 <- c(0.5, 1, 0.5)
n <- 1000

pm <- list(mean=p1, sd=p2)

x <- dthmm(NULL, Pi, c(0, 1, 0), "xyz", pm, discrete=FALSE)

x <- simulate(x, n, seed=5)

#    use above parameter values as initial values
y <- BaumWelch(x)

print(y$delta)
print(y$pm)
print(y$Pi)




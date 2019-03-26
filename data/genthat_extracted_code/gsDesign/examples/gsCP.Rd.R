library(gsDesign)


### Name: gsCP
### Title: 2.4: Conditional and Predictive Power, Overall and Conditional
###   Probability of Success
### Aliases: gsCP gsPP gsPI gsPOS gsCPOS gsPosterior
### Keywords: design

### ** Examples

# set up a group sequential design
x <- gsDesign(k=5)
x

# set up a prior distribution for the treatment effect
# that is normal with mean .75*x$delta and standard deviation x$delta/2
mu0 <-.75*x$delta
sigma0 <- x$delta/2
prior <- normalGrid(mu=mu0, sigma=sigma0)

# compute POS for the design given the above prior distribution for theta
gsPOS(x=x, theta=prior$z, wgts=prior$wgts)

# assume POS should only count cases in prior where theta >= x$delta/2
gsPOS(x=x, theta=prior$z, wgts=prior$wgts*(prior$z>=x$delta/2))

# assuming a z-value at lower bound at analysis 2, what are conditional 
# boundary crossing probabilities for future analyses
# assuming theta values from x as well as a value based on the interim
# observed z
CP <- gsCP(x, i=2, zi=x$lower$bound[2])
CP

# summing values for crossing future upper bounds gives overall
# conditional power for each theta value
CP$theta
t(CP$upper$prob) 

# compute predictive probability based on above assumptions
gsPP(x, i=2, zi=x$lower$bound[2], theta=prior$z, wgts=prior$wgts)

# if it is known that boundary not crossed at interim 2, use
# gsCPOS to compute conditional POS based on this
gsCPOS(x=x, i=2, theta=prior$z, wgts=prior$wgts)

# 2-stage example to compare results to direct computation
x<-gsDesign(k=2)
z1<- 0.5
n1<-x$n.I[1]
n2<-x$n.I[2]-x$n.I[1]
thetahat<-z1/sqrt(n1)
theta<-c(thetahat, 0 , x$delta)

# conditional power direct computation - comparison w gsCP
pnorm((n2*theta+z1*sqrt(n1)-x$upper$bound[2]*sqrt(n1+n2))/sqrt(n2))

gsCP(x=x, zi=z1, i=1)$upper$prob

# predictive power direct computation - comparison w gsPP
# use same prior as above
mu0 <- .75 * x$delta * sqrt(x$n.I[2])
sigma2 <- (.5 * x$delta)^2 *  x$n.I[2]
prior <- normalGrid(mu=.75 * x$delta, sigma=x$delta/2)
gsPP(x=x, zi=z1, i=1, theta=prior$z, wgts=prior$wgts)
t <- .5
z1 <- .5
b <- z1 * sqrt(t)
# direct from Proschan, Lan and Wittes eqn 3.10
# adjusted drift at n.I[2]
pnorm(((b - x$upper$bound[2]) * (1 + t * sigma2) +
        (1 - t) * (mu0 + b * sigma2)) /
      sqrt((1 - t) * (1 + sigma2) * (1 + t * sigma2)))

# plot prior then posterior distribution for unblinded analysis with i=1, zi=1
xp <- gsPosterior(x=x,i=1,zi=1,prior=prior)
plot(x=xp$z, y=xp$density, type="l", col=2, xlab=expression(theta), ylab="Density")
points(x=x$z, y=x$density, col=1)

# add posterior plot assuming only knowlede that interim bound has
# not been crossed at interim 1
xpb <- gsPosterior(x=x,i=1,zi=1,prior=prior)
lines(x=xpb$z,y=xpb$density,col=4)

# prediction interval based in interim 1 results
# start with point estimate, followed by 90% prediction interval
gsPI(x=x, i=1, zi=z1, j=2, theta=prior$z, wgts=prior$wgts, level=0)
gsPI(x=x, i=1, zi=z1, j=2, theta=prior$z, wgts=prior$wgts, level=.9)




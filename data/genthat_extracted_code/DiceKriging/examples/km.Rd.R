library(DiceKriging)


### Name: km
### Title: Fit and/or create kriging models
### Aliases: km
### Keywords: models htest

### ** Examples


# ----------------------------------
# A 2D example - Branin-Hoo function
# ----------------------------------

# a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
design.fact <- expand.grid(x1=seq(0,1,length=4), x2=seq(0,1,length=4))
y <- apply(design.fact, 1, branin) 

# kriging model 1 : matern5_2 covariance structure, no trend, no nugget effect
m1 <- km(design=design.fact, response=y)

# kriging model 2 : matern5_2 covariance structure, 
#                   linear trend + interactions, no nugget effect
m2 <- km(~.^2, design=design.fact, response=y)

# graphics 
n.grid <- 50
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x1=x.grid, x2=y.grid)
response.grid <- apply(design.grid, 1, branin)
predicted.values.model1 <- predict(m1, design.grid, "UK")$mean
predicted.values.model2 <- predict(m2, design.grid, "UK")$mean
par(mfrow=c(3,1))
contour(x.grid, y.grid, matrix(response.grid, n.grid, n.grid), 50, main="Branin")
points(design.fact[,1], design.fact[,2], pch=17, cex=1.5, col="blue")
contour(x.grid, y.grid, matrix(predicted.values.model1, n.grid, n.grid), 50, 
        main="Ordinary Kriging")
points(design.fact[,1], design.fact[,2], pch=17, cex=1.5, col="blue")
contour(x.grid, y.grid, matrix(predicted.values.model2, n.grid, n.grid), 50, 
        main="Universal Kriging")
points(design.fact[,1], design.fact[,2], pch=17, cex=1.5, col="blue")
par(mfrow=c(1,1))


# (same example) how to use the multistart argument
# -------------------------------------------------
require(foreach)

# below an example for a computer with 2 cores, but also work with 1 core

nCores <- 2
require(doParallel)
cl <-  makeCluster(nCores) 
registerDoParallel(cl)

# kriging model 1, with 4 starting points
m1_4 <- km(design=design.fact, response=y, multistart=4)

stopCluster(cl)

# -------------------------------
# A 1D example with penalized MLE
# -------------------------------

# from Fang K.-T., Li R. and Sudjianto A. (2006), "Design and Modeling for 
# Computer Experiments", Chapman & Hall, pages 145-152

n <- 6; d <- 1
x <- seq(from=0, to=10, length=n)
y <- sin(x)
t <- seq(0,10, length=100)

# one should add a small nugget effect, to avoid numerical problems
epsilon <- 1e-3
model <- km(formula<- ~1, design=data.frame(x=x), response=data.frame(y=y), 
            covtype="gauss", penalty=list(fun="SCAD", value=3), nugget=epsilon)

p <- predict(model, data.frame(x=t), "UK")

plot(t, p$mean, type="l", xlab="x", ylab="y", 
                     main="Prediction via Penalized Kriging")
points(x, y, col="red", pch=19)
lines(t, sin(t), lty=2, col="blue")
legend(0, -0.5, legend=c("Sine Curve", "Sample", "Fitted Curve"), 
       pch=c(-1,19,-1), lty=c(2,-1,1), col=c("blue","red","black"))


# ------------------------------------------------------------------------
# A 1D example with known trend and known or unknown covariance parameters
# ------------------------------------------------------------------------

x <- c(0, 0.4, 0.6, 0.8, 1);
y <- c(-0.3, 0, -0.8, 0.5, 0.9)

theta <- 0.01; sigma <- 3; trend <- c(-1,2)

model <- km(~x, design=data.frame(x=x), response=data.frame(y=y), 
            covtype="matern5_2", coef.trend=trend, coef.cov=theta, 
            coef.var=sigma^2)

# below: if you want to specify trend only, and estimate both theta and sigma:
# model <- km(~x, design=data.frame(x=x), response=data.frame(y=y), 
#             covtype="matern5_2", coef.trend=trend, lower=0.2)
# Remark: a lower bound or penalty function is useful here,
#         due to the very small number of design points...

# kriging with gaussian covariance C(x,y)=sigma^2 * exp(-[(x-y)/theta]^2), 
#         and linear trend t(x) = -1 + 2x

t <- seq(from=0, to=1, by=0.005)
p <- predict(model, newdata=data.frame(x=t), type="SK")
# beware that type = "SK" for known parameters (default is "UK")

plot(t, p$mean, type="l", ylim=c(-7,7), xlab="x", ylab="y")
lines(t, p$lower95, col="black", lty=2)
lines(t, p$upper95, col="black", lty=2)
points(x, y, col="red", pch=19)
abline(h=0)


# --------------------------------------------------------------
# Kriging with noisy observations (heterogeneous noise variance)
# --------------------------------------------------------------

fundet <- function(x){
return((sin(10*x)/(1+x)+2*cos(5*x)*x^3+0.841)/1.6)
}

level <- 0.5; epsilon <- 0.1
theta <- 1/sqrt(30); p <- 2; n <- 10
x <- seq(0,1, length=n)

# Heteregeneous noise variances: number of Monte Carlo evaluation among 
#                                a total budget of 1000 stochastic simulations
MC_numbers <- c(10,50,50,290,25,75,300,10,40,150)
noise.var <- 3/MC_numbers

# Making noisy observations from 'fundet' function (defined above)
y <- fundet(x) + noise.var*rnorm(length(x))

# kriging model definition (no estimation here)
model <- km(y~1, design=data.frame(x=x), response=data.frame(y=y), 
            covtype="gauss", coef.trend=0, coef.cov=theta, coef.var=1, 
            noise.var=noise.var)

# prediction
t <- seq(0, 1, by=0.01)
p <- predict.km(model, newdata=data.frame(x=t), type="SK")
lower <- p$lower95; upper <- p$upper95

# graphics
par(mfrow=c(1,1))
plot(t, p$mean, type="l", ylim=c(1.1*min(c(lower,y)) , 1.1*max(c(upper,y))), 
                xlab="x", ylab="y",col="blue", lwd=1.5)
polygon(c(t,rev(t)), c(lower, rev(upper)), col=gray(0.9), border = gray(0.9))
lines(t, p$mean, type="l", ylim=c(min(lower) ,max(upper)), xlab="x", ylab="y",
                 col="blue", lwd=1)
lines(t, lower, col="blue", lty=4, lwd=1.7)
lines(t, upper, col="blue", lty=4, lwd=1.7)
lines(t, fundet(t), col="black", lwd=2)
points(x, y, pch=8,col="blue")
text(x, y, labels=MC_numbers, pos=3)


# -----------------------------
# Checking parameter estimation 
# -----------------------------

d <- 3       	# problem dimension
n <- 40			# size of the experimental design
design <- matrix(runif(n*d), n, d)

covtype <- "matern5_2"		
theta <- c(0.3, 0.5, 1)		# the parameters to be found by estimation
sigma <- 2
nugget <- NULL  # choose a numeric value if you want to estimate nugget 
nugget.estim <- FALSE # choose TRUE if you want to estimate it

n.simu <- 30		# number of simulations
sigma2.estimate <- nugget.estimate <- mu.estimate <- matrix(0, n.simu, 1)
coef.estimate <- matrix(0, n.simu, length(theta))

model <- km(~1, design=data.frame(design), response=rep(0,n), covtype=covtype, 
            coef.trend=0, coef.cov=theta, coef.var=sigma^2, nugget=nugget)
y <- simulate(model, nsim=n.simu)

for (i in 1:n.simu) {
	# parameter estimation: tune the optimizer by changing optim.method, control
	model.estimate <- km(~1, design=data.frame(design), response=data.frame(y=y[i,]), 
	covtype=covtype, optim.method="BFGS", control=list(pop.size=50, trace=FALSE), 
        nugget.estim=nugget.estim) 
	
	# store results
	coef.estimate[i,] <- covparam2vect(model.estimate@covariance)
	sigma2.estimate[i] <- model.estimate@covariance@sd2
	mu.estimate[i] <- model.estimate@trend.coef
	if (nugget.estim) nugget.estimate[i] <- model.estimate@covariance@nugget
}

# comparison true values / estimation
cat("\nResults with ", n, "design points, 
    obtained with ", n.simu, "simulations\n\n",
    "Median of covar. coef. estimates: ", apply(coef.estimate, 2, median), "\n",
    "Median of trend  coef. estimates: ", median(mu.estimate), "\n", 
    "Mean of the var. coef. estimates: ", mean(sigma2.estimate))
if (nugget.estim) cat("\nMean of the nugget effect estimates: ", 
                      mean(nugget.estimate))

# one figure for this specific example - to be adapted
split.screen(c(2,1))        # split display into two screens
split.screen(c(1,2), screen = 2) # now split the bottom half into 3

screen(1)
boxplot(coef.estimate[,1], coef.estimate[,2], coef.estimate[,3], 
        names=c("theta1", "theta2", "theta3"))
abline(h=theta, col="red")
fig.title <- paste("Empirical law of the parameter estimates 
                    (n=", n , ", n.simu=", n.simu, ")", sep="")
title(fig.title)

screen(3)
boxplot(mu.estimate, xlab="mu")
abline(h=0, col="red")

screen(4)
boxplot(sigma2.estimate, xlab="sigma2")
abline(h=sigma^2, col="red")

close.screen(all = TRUE)  

# ----------------------------------------------------------
# Kriging with non-linear scaling on Xiong et al.'s function
# ----------------------------------------------------------

f11_xiong <- function(x){ 
return( sin(30 * (x - 0.9)^4) * cos(2 * (x - 0.9)) + (x - 0.9) / 2)
}

t <- seq(0, 1, , 300)
f <- f11_xiong(t)

plot(t, f, type = "l", ylim = c(-1,0.6), lwd = 2)

doe <- data.frame(x = seq(0, 1, , 20))
resp <- f11_xiong(doe)

knots <- list(x = c(0, 0.5, 1)) 
eta <- list(c(15, 2, 0.5))
m <- km(design = doe, response = resp, scaling = TRUE, gr = TRUE, 
knots = knots, covtype = "matern5_2",  coef.var = 1, coef.trend = 0)

p <- predict(m, data.frame(x = t), "UK")

plot(t, f, type = "l", ylim = c(-1, 0.6), lwd = 2)

lines(t, p$mean, col = "blue", lty = 2, lwd = 2)
lines(t, p$mean + 2 * p$sd, col = "blue")
lines(t, p$mean - 2 * p$sd, col = "blue")

abline(v = knots[[1]], lty = 2, col = "green")


# -----------------------------------------------------
# Kriging with a symmetric kernel: example with covUser
# -----------------------------------------------------

x <- c(0, 0.15, 0.3, 0.4, 0.5)
y <- c(0.3, -0.2, 0, 0.5, 0.2)

k <- function(x,y) {
  theta <- 0.15
  0.5*exp(-((x-y)/theta)^2) + 0.5*exp(-((1-x-y)/theta)^2)    
}

muser <- km(design=data.frame(x=x), response=data.frame(y=y), 
            coef.trend=0, kernel=k)

u <- seq(from=0, to=1, by=0.01)
puser <- predict(muser, newdata=data.frame(x=u), type="SK")

set.seed(0)
nsim <- 5
zuser <- simulate(muser, nsim=nsim, newdata=data.frame(x=u), cond=TRUE, nugget.sim=1e-8)
par(mfrow=c(1,1))
matplot(u, t(zuser), type="l", lty=rep("solid", nsim), col=1:5, lwd=1)
polygon(c(u, rev(u)), c(puser$upper, rev(puser$lower)), col="lightgrey", border=NA)
lines(u, puser$mean, lwd=5, col="blue", lty="dotted")
matlines(u, t(zuser), type="l", lty=rep("solid", nsim), col=1:5, lwd=1)
points(x, y, pch=19, cex=1.5)





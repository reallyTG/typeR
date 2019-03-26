library(jarbes)


### Name: hmr
### Title: Bayesian meta-analysis to combine aggregated and individual
###   participant data for cross design synthesis.
### Aliases: hmr

### ** Examples


library(jarbes)

data("healing")
AD <- healing[, c("y_c", "n_c", "y_t", "n_t")]

data("healingipd")

IPD <- healingipd[, c("healing.without.amp", "PAD", "neuropathy", 
"first.ever.lesion", "no.continuous.care", "male", "diab.typ2",
"insulin", "HOCHD", "HOS", "CRF", "dialysis", "DNOAP", "smoking.ever",
"diabdur", "wagner.class")]

mx2 <- hmr(AD, two.by.two = FALSE, 
           dataIPD = IPD, 
           re = "sm", 
           link = "logit",
           sd.mu.1 = 2,
           sd.mu.2 = 2,
           sd.mu.phi = 2,
           sigma.1.upper = 5,
           sigma.2.upper = 5,
           sigma.beta.upper = 5,
           sd.Fisher.rho = 1.25,
           df.estimate = FALSE,
           df.lower = 3,
           df.upper = 10,
           nr.chains = 1, 
           nr.iterations = 1500,
           nr.adapt = 100,
           nr.thin = 1)

print(mx2)


## No test: 


# This experiment corresponds to Section 4 in Verde (2018).
#
# Experiment: Combining aggretated data from RCTs and a single 
# observational study with individual participant data.
#
# In this experiment we assess conflict of evidence between the RCTs
# and the observational study with a partially identified parameter
# mu.phi.
# 
# We run two simulated data: 1) mu.phi = 0.5 which is diffucult to
# identify. 2) mu.phi = 2 which can be identify. The simulations are
# used to see if the hmr() function can recover mu.phi.
#


library(MASS)
library(ggplot2)
library(jarbes)
library(gridExtra)
library(mcmcplots)


# Simulation of the IPD data

invlogit <- function (x) 
{
 1/(1 + exp(-x))
}

# Data set for mu.phi = 0.5 .........................................

# Parameters values
mu.phi.true <- 0.5
beta0 <- mu.1.true + mu.phi.true
beta1 <- 2.5
beta2 <- 2

# Regression variables

x1 <- rnorm(200)
x2 <- rbinom(200, 1, 0.5)

# Binary outcome as a function of "b0 + b1 * x1 + b2 * x2"

y <- rbinom(200, 1,
         invlogit(beta0 + beta1 * x1 + beta2 * x2))
         
         
# Preparing the plot to visualize the data
jitter.binary <- function(a, jitt = 0.05)
 
 ifelse(a==0, runif(length(a), 0, jitt),
        runif(length(a), 1-jitt, 1))
        


plot(x1, jitter.binary(y), xlab = "x1",
    ylab = "Success probability")

curve(invlogit(beta0 + beta1*x),
     from = -2.5, to = 2.5, add = TRUE, col ="blue", lwd = 2)
curve(invlogit(beta0 + beta1*x + beta2),
     from = -2.5, to = 2.5, add = TRUE, col ="red", lwd =2)
legend("bottomright", c("b2 = 0", "b2 = 2"),
      col = c("blue", "red"), lwd = 2, lty = 1)

noise <- rnorm(100*20)
dim(noise) <- c(100, 20)
n.names <- paste(rep("x", 20), seq(3, 22), sep="")
colnames(noise) <- n.names

data.IPD <- data.frame(y, x1, x2, noise)


# Application of HMR ...........................................

res.s2 <- hmr(AD.s1, two.by.two = FALSE, 
             dataIPD = data.IPD,
             sd.mu.1 = 2,
             sd.mu.2 = 2,
             sd.mu.phi = 2,
             sigma.1.upper = 5,
             sigma.2.upper = 5, 
             sd.Fisher.rho = 1.5)
             
         
print(res.s2)

# Data set for mu.phi = 2 ......................................
# Parameters values

mu.phi.true <- 2
beta0 <- mu.1.true + mu.phi.true
beta1 <- 2.5
beta2 <- 2

# Regression variables
x1 <- rnorm(200)
x2 <- rbinom(200, 1, 0.5)
# Binary outcome as a function of "b0 + b1 * x1 + b2 * x2"
y <- rbinom(200, 1,
           invlogit(beta0 + beta1 * x1 + beta2 * x2))

# Preparing the plot to visualize the data
jitter.binary <- function(a, jitt = 0.05)
 
 ifelse(a==0, runif(length(a), 0, jitt),
        runif(length(a), 1-jitt, 1))
        
plot(x1, jitter.binary(y), xlab = "x1",
    ylab = "Success probability")

curve(invlogit(beta0 + beta1*x),
     from = -2.5, to = 2.5, add = TRUE, col ="blue", lwd = 2)
curve(invlogit(beta0 + beta1*x + beta2),
     from = -2.5, to = 2.5, add = TRUE, col ="red", lwd =2)
legend("bottomright", c("b2 = 0", "b2 = 2"),
      col = c("blue", "red"), lwd = 2, lty = 1)
      
noise <- rnorm(100*20)
dim(noise) <- c(100, 20)
n.names <- paste(rep("x", 20), seq(3, 22), sep="")
colnames(noise) <- n.names

data.IPD <- data.frame(y, x1, x2, noise)

# Application of HMR ................................................


res.s3 <- hmr(AD.s1, two.by.two = FALSE, 
             dataIPD = data.IPD,
             sd.mu.1 = 2,
             sd.mu.2 = 2,
             sd.mu.phi = 2,
             sigma.1.upper = 5,
             sigma.2.upper = 5, 
             sd.Fisher.rho = 1.5
)

print(res.s3)

# Posteriors for mu.phi ............................
attach.jags(res.s2)
mu.phi.0.5 <- mu.phi
df.phi.05 <- data.frame(x = mu.phi.0.5)

attach.jags(res.s3)
mu.phi.1 <- mu.phi
df.phi.1 <- data.frame(x = mu.phi.1)


p1 <- ggplot(df.phi.05, aes(x=x))+
 xlab(expression(mu[phi])) +
 ylab("Posterior distribution")+
 xlim(c(-7,7))+
 geom_histogram(aes(y=..density..),fill = "royalblue", 
              colour = "black", alpha= 0.4, bins=60) +
 geom_vline(xintercept = 0.64, colour = "black", size = 1.7, lty = 2)+
 geom_vline(xintercept = 0.5, colour = "black", size = 1.7, lty = 1)+
 stat_function(fun = dlogis, 
               n = 101, 
               args = list(location = 0, scale = 1), size = 1.5) + theme_bw()
               
p2 <- ggplot(df.phi.1, aes(x=x))+
 xlab(expression(mu[phi])) +
 ylab("Posterior distribution")+
 xlim(c(-7,7))+
 geom_histogram(aes(y=..density..),fill = "royalblue", 
                colour = "black", alpha= 0.4, bins=60) +
 geom_vline(xintercept = 2.2, colour = "black", size = 1.7, lty = 2)+
 geom_vline(xintercept = 2, colour = "black", size = 1.7, lty = 1)+
 stat_function(fun = dlogis, 
               n = 101, 
               args = list(location = 0, scale = 1), size = 1.5) + theme_bw()

grid.arrange(p1, p2, ncol = 2, nrow = 1)


# Catter plots for regression coefficients ...........................

var.names <- names(data.IPD[-1])
v <- paste("beta", names(data.IPD[-1]), sep = ".")
mcmc.x <- as.rjags.mcmc(res.s2$BUGSoutput$sims.matrix)
mcmc.x.2 <- as.mcmc.rjags(res.s2)
mcmc.x.3 <- as.mcmc.rjags(res.s3)

greek.names <- paste(paste("beta[",1:22, sep=""),"]", sep="")
par.names <- paste(paste("beta.IPD[",1:22, sep=""),"]", sep="")

caterplot(mcmc.x.2,  
         parms = par.names,
         col = "black", lty = 1, 
         labels = greek.names,
         greek = T,
         labels.loc="axis", cex =0.7, 
         style = "plain",reorder = F, denstrip = F)

caterplot(mcmc.x.3,  
         parms = par.names,
         col = "grey", lty = 2, 
         labels = greek.names,
         greek = T,
         labels.loc="axis", cex =0.7, 
         style = "plain",reorder = F, denstrip = F,
         add = TRUE,
         collapse=TRUE, cat.shift=-0.5)
         
       

abline(v=0, lty = 2, lwd = 2)
abline(v =2, lty = 2, lwd = 2)
abline(v =2.5, lty = 2, lwd = 2)

# End of the examples.
## End(No test)






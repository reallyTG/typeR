library(jarbes)


### Name: metarisk
### Title: Bayesian meta-analysis to investigate the relationship between
###   treatment effect and underlying risk.
### Aliases: metarisk

### ** Examples



library(jarbes)

# This example is used to test the function and it runs in about 5 seconds.
# In a real application you must increase the number of MCMC interations. 
# For example use: nr.burnin = 5000 and nr.iterations = 20000

data(ppvcap)
dat <- ppvcap[, c("yt","nt","yc","nc")]
res.hmr.1 <- metarisk(dat,             # Data frame
                      two.by.two = FALSE,    # Data is given as: (tp, n1, fp, n2)
                      re = "sm",             # Random effects distribution
                      link = "logit",        # Link function
                      sd.Fisher.rho   = 1.7, # Prior standard deviation of correlation
                      split.w = TRUE,        # Split the studies' weights
                      df.estimate = TRUE,    # Estimate the posterior of df parameter.
                      nr.burnin = 100,       # Iterations for burnin
                      nr.iterations = 1000,  # Total iterations
                      nr.chains = 2,         # Number of chains
                      r2jags = TRUE)         # Use r2jags as interface to jags
                      
print(res.hmr.1, digits = 3)



## No test: 

# The following examples corresponds to Section 4 in Verde (2018).
# These are simulated examples to investigate internal and external validity
# bias in meta-analysi.


library(MASS)
library(ggplot2)
library(jarbes)
library(gridExtra)
library(mcmcplots)

#Experiment 1: External validity bias

set.seed(2018)
# mean control 
pc <- 0.7
# mean treatment 
pt <- 0.4
# reduction of "amputations" odds ratio
OR <- (pt/(1-pt)) /(pc/(1-pc))
OR

# mu_2
log(OR)
mu.2.true <- log(OR)
#sigma_2
sigma.2.true <- 0.5
# mu_1
mu.1.true <- log(pc/(1-pc))
mu.1.true
#sigma_1
sigma.1.true <- 1
# rho
rho.true <- -0.5
Sigma <- matrix(c(sigma.1.true^2, sigma.1.true*sigma.2.true*rho.true,
                 sigma.1.true*sigma.2.true*rho.true, sigma.2.true^2), 
                 byrow = TRUE, ncol = 2)
Sigma

theta <- mvrnorm(35, mu = c(mu.1.true, mu.2.true),
                Sigma = Sigma )
                
                
plot(theta, xlim = c(-2,3))
abline(v=mu.1.true, lty = 2)
abline(h=mu.2.true, lty = 2)
abline(a = mu.2.true, b=sigma.2.true/sigma.1.true * rho.true, col = "red")
abline(lm(theta[,2]~theta[,1]), col = "blue")

# Target group
mu.T <- mu.1.true + 2 * sigma.1.true
abline(v=mu.T, lwd = 3, col = "blue")
eta.true <- mu.2.true + sigma.2.true/sigma.1.true*rho.true* mu.T
eta.true
exp(eta.true)
abline(h = eta.true, lty =3, col = "blue")
# Simulation of each primary study:
n.c <- round(runif(35, min = 30, max = 60),0)
n.t <- round(runif(35, min = 30, max = 60),0)
y.c <- y.t <- rep(0, 35)
p.c <- exp(theta[,1])/(1+exp(theta[,1]))
p.t <- exp(theta[,2]+theta[,1])/(1+exp(theta[,2]+theta[,1]))
for(i in 1:35)
{
 y.c[i] <- rbinom(1, n.c[i], prob = p.c[i])
 y.t[i] <- rbinom(1, n.t[i], prob = p.t[i])
}

AD.s1 <- data.frame(yc=y.c, nc=n.c, yt=y.t, nt=n.t)

##########################################################
incr.e <- 0.05
incr.c <- 0.05
n11 <- AD.s1$yt 
n12 <- AD.s1$yc 
n21 <- AD.s1$nt - AD.s1$yt 
n22 <- AD.s1$nc - AD.s1$yc
AD.s1$TE <- log(((n11 + incr.e) * (n22 + incr.c))/((n12 + incr.e) * (n21 + incr.c)))
AD.s1$seTE <- sqrt((1/(n11 + incr.e) + 1/(n12 + incr.e) + 
                     1/(n21 + incr.c) + 1/(n22 + incr.c)))

Pc <- ((n12 + incr.c)/(AD.s1$nc + 2*incr.c))

AD.s1$logitPc <- log(Pc/(1-Pc))

AD.s1$Ntotal <- AD.s1$nc + AD.s1$nt
rm(list=c("Pc", "n11","n12","n21","n22","incr.c", "incr.e"))


dat.points <- data.frame(TE = AD.s1$TE, logitPc = AD.s1$logitPc, N.total = AD.s1$Ntotal)
###################################################################

res.s1 <- metarisk(AD.s1, two.by.two = FALSE, sigma.1.upper = 5,
                  sigma.2.upper = 5, 
                  sd.Fisher.rho = 1.5)

print(res.s1, digits = 4)


library(R2jags)
attach.jags(res.s1)
eta.hat <- mu.2 + rho*sigma.2/sigma.1*(mu.T - mu.1)
mean(eta.hat)
sd(eta.hat)

OR.eta.hat <- exp(eta.hat)
mean(OR.eta.hat)
sd(OR.eta.hat)
quantile(OR.eta.hat, probs = c(0.025, 0.5, 0.975))

ind.random <- sample(1:18000, size = 80, replace = F)

##############################################################               
p1 <- ggplot(dat.points, aes(x = logitPc, y = TE, size = N.total)) +
      xlab("logit Baseline Risk")+
      ylab("log(Odds Ratio)")+
      geom_point(shape = 21, colour = "blue") + scale_size_area(max_size=10)+
      scale_x_continuous(name= "Rate of The Control Group (logit scale)", 
                       limits=c(-2, 5)) +
     geom_vline(xintercept = mu.T, colour = "blue", size = 1, lty = 1) +
       geom_hline(yintercept = eta.true, colour = "blue", size = 1, lty = 1)+
         geom_abline(intercept=beta.0[ind.random], 
                   slope=beta.1[ind.random],alpha=0.3,
                   colour = "grey", size = 1.3, lty = 2)+
         geom_abline(intercept = mean(beta.0[ind.random]), 
         slope = mean(beta.1[ind.random]),
         colour = "black", size = 1.3, lty = 2)+
     geom_abline(intercept = mu.2.true, slope = sigma.2.true/sigma.1.true * rho.true,
     colour = "blue", size = 1.2)+ theme_bw() 
     
     
# Posterior of eta.hat

eta.df <- data.frame(x = OR.eta.hat)


p2 <- ggplot(eta.df, aes(x = x)) + 
 xlab("Odds Ratio") +
 ylab("Posterior distribution")+ 
 geom_histogram(fill = "royalblue", colour = "black", alpha= 0.4, bins=80) +
 geom_vline(xintercept = exp(eta.true), colour = "black", size = 1.7, lty = 1)+
 geom_vline(xintercept = c(0.28, 0.22, 0.35), colour = "black", size = 1, lty = 2)+
 theme_bw()


grid.arrange(p1, p2, ncol = 2, nrow = 1)

#Experiment 2: Internal validity bias and assesing conflict of evidence between the RCTs.


set.seed(2018)
ind <- sample(1:35, size=5, replace = FALSE)
ind
AD.s4.contaminated <- AD.s1[ind,1:4]
AD.s4.contaminated$yc <- AD.s1$yt[ind]
AD.s4.contaminated$yt <- AD.s1$yc[ind]
AD.s4.contaminated$nc <- AD.s1$nt[ind]
AD.s4.contaminated$nt <- AD.s1$nc[ind]
AD.s4.contaminated <- rbind(AD.s4.contaminated,
                         AD.s1[-ind,1:4])
                         
res.s4 <- metarisk(AD.s4.contaminated, 
                   two.by.two = FALSE,
                   re = "sm",
                   sigma.1.upper = 3,
                   sigma.2.upper = 3, 
                   sd.Fisher.rho = 1.5,
                   df.estimate = TRUE)
                   
print(res.s4, digits = 4)

attach.jags(res.s4)

w.s <- apply(w, 2, median)
w.u <- apply(w, 2, quantile, prob = 0.75)
w.l <- apply(w, 2, quantile, prob = 0.25)

studies <- c(ind,c(1,3,4,5,6,8,9,10,11,13,14,17,18,19,20:35))


dat.weights <- data.frame(x = studies,
                         y = w.s,
                        ylo  = w.l,
                        yhi  = w.u)
                        
# Outliers:
w.col <- studies %in% ind
w.col.plot <- ifelse(w.col, "black", "grey")
w.col.plot[c(9,17, 19,27,34,35)] <- "black"

w.plot <- function(d){
  # d is a data frame with 4 columns
  # d$x gives variable names
  # d$y gives center point
  # d$ylo gives lower limits
  # d$yhi gives upper limits
  
  p <- ggplot(d, aes(x=x, y=y, ymin=ylo, ymax=yhi) )+ 
       geom_pointrange( colour=w.col.plot, lwd =0.8)+
       coord_flip() + geom_hline(yintercept = 1, lty=2)+ 
       xlab("Study ID") +
       ylab("Scale mixture weights") + theme_bw()
       return(p)}
       
w.plot(dat.weights)

#List of other possible statistical models:
#    1) Different link functions: logit, cloglog and probit

#    2) Different random effects distributions:
#       "normal" or "sm = scale mixtures".

#    3) For the scale mixture random effects:
#       split.w = TRUE => "split the weights".

#    4) For the scale mixture random effects:
#       df.estimate = TRUE => "estimate the degrees of freedom".

#    5) For the scale mixture random effects:
#       df.estimate = TRUE => "estimate the degrees of freedom".

#    6) For the scale mixture random effects:
#       df = 4 => "fix the degrees of freedom to a particual value".
#       Note that df = 1 fits a Cauchy bivariate distribution to 
#       the random effects.
#End of the examples

## End(No test)






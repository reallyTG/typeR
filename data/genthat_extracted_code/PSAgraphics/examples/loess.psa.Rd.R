library(PSAgraphics)


### Name: loess.psa
### Title: Graphic for data and loess-based estimate of effect size after
###   propensity score adjustment
### Aliases: loess.psa
### Keywords: hplot

### ** Examples

#Artificial example where ATE should be 1 over all of (0,1).
response1 <- c(rep(1, 100), rep(2, 100), rep(3, 100)) + rnorm(300, 0, .5)
response0 <- c(rep(0, 100), rep(1, 100), rep(2, 100)) + rnorm(300, 0, .5)
response <- c(response1, response0)
treatment <- c(rep(1, 300), rep(0, 300))
propensity <- rep(seq(.01, .99, (.98/299)), 2)
a <- data.frame(response, treatment, propensity)
loess.psa(a, span = .15, degree = 1, int = c(0, .33, .67, 1))


#Artificial example where estimates are unstable with varying 
#numbers of strata. Note: sometimes get empty treatment/strata error.
rr <- c(rnorm(150, 3, .75), rnorm(700, 0, .75), rnorm(150, 3, .75), 
     rnorm(150, -3, .75), rnorm(700, 0, .75), rnorm(150, -3, .75))
tt <- c(rep(1, 1000),rep(0, 1000))
pp <- NULL
for(i in 1:1000){pp <- c(pp, rnorm(1, 0, .05) + .00045*i + .25)}
for(i in 1:1000){pp <- c(pp, rnorm(1, 0, .05) + .00045*i + .4)}
a <- data.frame(rr, tt, pp)
loess.psa(a, span=.5, cex = .6)

#Using strata of possible interest as determined by loess lines.
data(lindner)
attach(lindner)
lindner.ps <- glm(abcix ~ stent + height + female + 
      diabetic + acutemi + ejecfrac + ves1proc, 
      data = lindner, family = binomial)
loess.psa(log(cardbill), abcix, lindner.ps$fitted,  
         int = c(.37, .56, .87, 1), lines = TRUE)
         abline(v=c(.37, 56, .87))
         



library(ResourceSelection)


### Name: rsf
### Title: Resource Selection (Probability) Functions for Use-Availability
###   Data
### Aliases: rsf.fit rsf rspf rsf.null
### Keywords: htest

### ** Examples

## --- Simulated data example ---

## settings
n.used <- 1000
m <- 10
n <- n.used * m
set.seed(1234)
x <- data.frame(x1=rnorm(n), x2=runif(n))
cfs <- c(1.5,-1,0.5)
## fitting Exponential RSF model
dat1 <- simulateUsedAvail(x, cfs, n.used, m, link="log")
m1 <- rsf(status ~ .-status, dat1, m=0, B=0)
summary(m1)
## fitting Logistic RSPF model
dat2 <- simulateUsedAvail(x, cfs, n.used, m, link="logit")
m2 <- rspf(status ~ .-status, dat2, m=0, B=0)
summary(m2)

## --- Real data analysis from Lele & Keim 2006 ---

## Not run: 
##D goats$exp.HLI <- exp(goats$HLI)
##D goats$sin.SLOPE <- sin(pi * goats$SLOPE / 180)
##D goats$ELEVATION <- scale(goats$ELEVATION)
##D goats$ET <- scale(goats$ET)
##D goats$TASP <- scale(goats$TASP)
##D 
##D ## Fit two RSPF models:
##D ## global availability (m=0) and bootstrap (B=99)
##D m1 <- rspf(STATUS ~ TASP + sin.SLOPE + ELEVATION, goats, m=0, B = 99)
##D m2 <- rspf(STATUS ~ TASP + ELEVATION, goats, m=0, B = 99)
##D 
##D ## Inspect the summaries
##D summary(m1)
##D summary(m2)
##D 
##D ## Compare models: looks like m1 is better supported
##D CAIC(m1, m2)
##D 
##D ## Visualize the relationships
##D plot(m1)
##D mep(m1) # marginal effects similar to plot but with CIs
##D kdepairs(m1) # 2D kernel density estimates
##D plot(m2)
##D kdepairs(m2)
##D mep(m2)
##D 
##D ## fit and compare to null RSF model (not available for RSPF)
##D m3 <- rsf(STATUS ~ TASP + ELEVATION, goats, m=0, B = 0)
##D m4 <- rsf.null(Y=goats$STATUS, m=0)
##D CAIC(m3, m4)
## End(Not run)




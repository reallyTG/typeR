library(eivtools)


### Name: lr_ancova
### Title: Latent Regression for Group Effects with Latent Heteroskedastic
###   Error Variance
### Aliases: lr_ancova
### Keywords: models

### ** Examples


## No test: 
set.seed(3001)
cat("NOTE: this example uses MCMC and takes a little while to run\n")

## example of estimating school "value-added" effects on math test scores,
## adjusting for lag 1 math and ELA scores and accounting for the
## heteroskedastic measurement errors in those scores.
data(testscores)
print(length(unique(testscores$schoolid)))

## to help interpretation of model coefficients and school effects, standardize
## current and lag 1 test scores to have mean zero and variance 1.  Also adjust
## the conditional standard errors of measurement for the lag 1 scores.
testscores$math <- as.vector(scale(testscores$math))

testscores$math_lag1_csem <- testscores$math_lag1_csem / sd(testscores$math_lag1)
testscores$math_lag1      <- as.vector(scale(testscores$math_lag1))

testscores$lang_lag1_csem <- testscores$lang_lag1_csem / sd(testscores$lang_lag1)
testscores$lang_lag1      <- as.vector(scale(testscores$lang_lag1))

## create pieces needed to call lr_ancova.  Note that first column of Z
## must be an intercept.
outcome_model <- "normal"
Y             <- testscores$math
W             <- testscores[,c("math_lag1","lang_lag1")]
Z             <- cbind(1, testscores[,c("sped","frl")])
G             <- testscores$schoolid

## create varfuncs.  Need to be careful to pass conditional measurement error
## variances, which require squaring the CSEMs
varfuncs   <- list()

tmp        <- unique(testscores[,c("math_lag1","math_lag1_csem")])
names(tmp) <- c("x","gx")
tmp        <- tmp[order(tmp$x),]
tmp$gx     <- tmp$gx^2
varfuncs[[1]] <- list(type="log_polynomial", vtab=tmp)

tmp        <- unique(testscores[,c("lang_lag1","lang_lag1_csem")])
names(tmp) <- c("x","gx")
tmp        <- tmp[order(tmp$x),]
tmp$gx     <- tmp$gx^2
varfuncs[[2]] <- list(type="log_polynomial", vtab=tmp)

## fit the model.  NOTE: in practice, larger values of n.iter and n.burnin
## would typically be used; they are kept small here so that the example
## runs relatively quickly.
m1 <- lr_ancova(outcome_model, Y, W, Z, G, varfuncs, n.iter=300, n.burnin=100)

## you can check the approximation to the variance functions by looking at the
## PDF file:
print(m1$lr_ancova_extras$plot.location)

## and also can look at the JAGS model file:
print(m1$lr_ancova_extras$model.location)

## the model object is of class "rjags" and so inherits the appropriate methods,
## including print:
print(m1)
## betaXG, betaXZ, and varXgivenZG are for the conditional distribution of X
## given (Z,G).  betaYG, betaYXZ and sdYgivenXZG are for the conditional
## distribution of Y given (X,Z,G).
##
## the first two elements of betaYXZ are the coefficients for the two columns of
## X, whereas the following three elements are the coefficients for the three
## columns of Z.
##
## the school effects are in betaYG.  extract their posterior means and
## posterior standard deviations:
e <- m1$BUGSoutput$summary
e <- as.data.frame(e[grep("betaYG",rownames(e)),c("mean","sd")])
## check the sum-to-zero constraints:
print(sum(e$mean))
## put the actual school IDs onto "e"
e$schoolid <- m1$lr_ancova_extras$group.map$G
print(e)

## compare the school effect estimates to those from a simpler model that does
## not adjust for the lag 1 ELA score, and does not account for the measurement
## error in the lag 1 math score.  Use sum-to-zero contrasts and recover the
## estimate for the last school as negative the sum of the other estimates.
testscores$schid <- factor(testscores$schoolid)
m0 <- lm(math ~ math_lag1 + sped + frl + schid,
         data=testscores, contrasts=list(schid = "contr.sum"))
s  <- coef(m0)[grep("schid", names(coef(m0)))]
e$est_m0 <- c(s, -sum(s))

## Such estimates should have some amount of omitted variable bias, which
## should manifest as the differences between the "m0" and "m1" estimates
## being positively correlated with average prior achievement.
print(cor(tapply(testscores$math_lag1, testscores$schoolid, mean), e$est_m0 - e$mean))
print(cor(tapply(testscores$lang_lag1, testscores$schoolid, mean), e$est_m0 - e$mean))
## End(No test)




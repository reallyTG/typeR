library(eivtools)


### Name: deconv_npmle
### Title: Nonparametric MLE deconvolution under heteroskedastic normal
###   error
### Aliases: deconv_npmle
### Keywords: models

### ** Examples

data(testscores)

## get the unique values of the lag 1 math score and CSEM
## values and approximate the CSEM function using approxfun()
tmp <- unique(testscores[,c("math_lag1","math_lag1_csem")])
print(tmp <- tmp[order(tmp$math_lag1),])

.csem <- approxfun(tmp$math_lag1, tmp$math_lag1_csem, rule=2:2)
plot(tmp$math_lag1, tmp$math_lag1_csem)
lines(tmp$math_lag1, .csem(tmp$math_lag1), col="blue")

## get NPMLE distribution of latent lag 1 math achievement
m <- deconv_npmle(W        = testscores$math_lag1,
                  csem     = .csem,
                  gridspec = list(fixed = FALSE,
                                  xmin = min(testscores$math_lag1),
                                  xmax = max(testscores$math_lag1),
                                  numpoints = 10000),
                  quietly  = TRUE)

print(m$px)

## estimated mean is approximately the mean of W, but
## the estimated variance is less than the variance of W,
## as it should be
print(c(empirical = mean(testscores$math_lag1),
        estimated = m$px$ex[1]))

print(c(empirical = var(testscores$math_lag1),
        estimated = m$px$varx[1]))

## estimated reliability of W:
print(m$reliability)

## if implementing SIMEX, simex_varfuncs provides plug-in
## options to use for the heteroskedastic error variance
## of each observed W
print(m$simex_varfuncs)

## simple "value-added" estimates of school effects on math,
## adjusting for measurement error in the lag 1 math score.
testscores$schoolid <- factor(testscores$schoolid)

meiv <- eivreg(math ~ math_lag1 + sped + frl + schoolid,
         data = testscores,
         reliability = c(math_lag1 = m$reliability),
         contrasts = list(schoolid = "contr.sum"))

print(summary(meiv))

## alternative deconvolution with fixed grid
m <- deconv_npmle(W        = testscores$math_lag1,
                  csem     = .csem,
                  gridspec = list(fixed = TRUE,
                                  xmin = min(testscores$math_lag1),
                                  xmax = max(testscores$math_lag1),
                                  numpoints = 40),
                  quietly  = TRUE)

print(m$px)





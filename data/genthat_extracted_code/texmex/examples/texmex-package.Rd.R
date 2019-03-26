library(texmex)


### Name: texmex-package
### Title: Extreme value modelling
### Aliases: texmex-package texmex
### Keywords: models multivariate package

### ** Examples


# Analyse the winter data used by Heffernan and Tawn
mymex <- mex(winter, mqu = .7, penalty="none", dqu=.7, which = "NO")
plot(mymex)
# Only do 10 replicates to keep CRAN checks happy. Do many more in any
# real application
myboot <- bootmex(mymex, R=10)
plot(myboot)
mypred <- predict(myboot,  pqu=.95)
summary(mypred , probs = c( .025, .5, .975 ))

# Analyse the liver data included in the package
library(MASS) # For the rlm function

liver <- liver[liver$ALP.M > 1,] # Get rid of outlier
liver$ndose <- as.numeric(liver$dose)

alt <- resid(rlm(log(ALT.M) ~ log(ALT.B) + ndose, data=liver, method="MM"))
ast <- resid(rlm(log(AST.M) ~ log(AST.B) + ndose, data=liver, method="MM"))
alp <- resid(rlm(log(ALP.M) ~ log(ALP.B) + ndose, data=liver, method="MM"))
tbl <- resid(rlm(log(TBL.M) ~ log(TBL.B) + ndose, data=liver, method="MM"))

r <- data.frame(alt=alt, ast=ast, alp=alp, tbl=tbl)

Amex <- mex(r[liver$dose == "A",], mqu=.7)
Bmex <- mex(r[liver$dose == "B",], mqu=.7)
Cmex <- mex(r[liver$dose == "C",], mqu=.7)
Dmex <- mex(r[liver$dose == "D",], mqu=.7)

par(mfcol=c(3,3))
plot(Amex)

plot(Dmex, col="blue")

## Take a closer look at the marginal behaviour of ALT
## No test: 
r$ndose <- liver$ndose

altmod1 <- evm(alt, qu=.7, phi = ~ ndose, xi = ~ ndose, data=r)
altmod2 <- evm(alt, qu=.7, phi = ~ ndose, data=r)
altmod3 <- evm(alt, qu=.7, xi = ~ ndose, data=r)
altmod4 <- evm(alt, qu=.7, data=r)

# Prefer model 3, with term for xi on basis of AIC

balt3 <- evm(alt, qu=.7, xi = ~ ndose, data=r, method="simulate")
par(mfrow=c(3,3))
plot(balt3)

# use longer burn-in and also thin the output

balt3 <- thinAndBurn(balt3,burn=1000,thin=5)
plot(balt3)

# Get some simulated values for dose D

#DParam <- predict(balt3,type="lp",newdata=data.frame(ndose=4),all=TRUE)$obj$link[[1]]

simD <- rgpd(nrow(DParam), sigma=exp(DParam[,"phi"]), xi=DParam[,"xi"], u=quantile(alt, .7))

# These are simulated residuals. Get some baselines and transform all
# to raw scale

b <- sample(log(liver$ALT.M), size=nrow(balt3$param), replace=TRUE)
res <- exp(b + simD)

# estimate quantiles on raw scale
quantile(res, prob=c(.5, .75, .9, .95, .99))

# estimate proportion exceeding 3*upper limit of normal mean(res >
# 36 * 3) # 36 is the upper limit of normal for ALT
## End(No test)




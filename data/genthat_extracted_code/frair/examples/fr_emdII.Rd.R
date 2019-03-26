library(frair)


### Name: fr_emdII
### Title: EMD Type II Response
### Aliases: fr_emdII emdII emdII_fit emdII_nll

### ** Examples

data(gammarus)
fitP1 <- frair_fit(eaten~density, data=gammarus, 
                response='emdII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24, P=1))
fitP2 <- frair_fit(eaten~density, data=gammarus, 
                response='emdII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24, P=2))
# Note that the coefficients are scaled to per prey item
coef(fitP1)
coef(fitP2)

# Should give identical answers to rogersII when P=1
rogII <- frair_fit(eaten~density, data=gammarus, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24))
coef(fitP1)
coef(rogII)

stopifnot(coef(fitP1)[1]==coef(rogII)[1])
stopifnot(coef(fitP1)[2]==coef(rogII)[2])





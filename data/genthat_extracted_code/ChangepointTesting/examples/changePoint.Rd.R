library(ChangepointTesting)


### Name: changePoint
### Title: Change Point Estimation for Clustered Signals
### Aliases: changePoint plot,changePoint BH,changePoint CW,changePoint
###   FDRL,changePoint critical,changePoint numAlt,changePoint
###   pAlt,changePoint sigmaSq,changePoint BH blocks CW FDRL critical
###   numAlt piAlt sigmaSq changePts

### ** Examples


m <- 5000

T <- c(rep(0.1,  75), rep( 0.8, 75), rep(1.8, 100), 
       rep(0.0,2250), rep(-1.5,250), rep(0.0,2250)) + 
     rnorm(m, mean=0.0, sd = 1.0)

pv <- 2.0*(1.0-pnorm(abs(T)))

res <- changePoint(pvalues = pv, 
                   alpha = 0.05, 
                   km = {log(m)}^2, 
                   lm = m^{1/4}, 
                   compare = "Both")

print(changePts(res))

print(head(cbind(BH(res),FDRL(res),CW(res))))





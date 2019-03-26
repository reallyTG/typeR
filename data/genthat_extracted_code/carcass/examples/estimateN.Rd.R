library(carcass)


### Name: estimateN
### Title: Estimation of number of killed animals based on carcass searches
###   and estimates for detection probability
### Aliases: estimateN
### Keywords: methods misc

### ** Examples


estimateN(count=3, f=0.72, f.lower=0.62, f.upper=0.81, s=0.84, s.lower=0.64, 
            s.upper=0.94, d=2, pform="korner", n=100, maxn=500, nsim=1000, 
            plot=TRUE)

estimateN(count=3, f=0.72, f.lower=0.62, f.upper=0.81, s=0.84, s.lower=0.64, 
            s.upper=0.94, d=2, pform="huso", maxn=500, nsim=1000, plot=TRUE)

res.p <- pkorner(f=0.72, f.lower=0.62, f.upper=0.81, s=0.84, s.lower=0.64, s.upper=0.94, 
                 d=2, n=100, CI=TRUE)
estimateN(count=3, p=res.p["p"], p.lower=res.p["2.5%"], p.upper=res.p["97.5%"])





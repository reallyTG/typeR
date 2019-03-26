library(carcass)


### Name: pkorner
### Title: Carcass detection probability acording to Korner-Nievergelt et
###   al. 2011
### Aliases: pkorner
### Keywords: methods misc

### ** Examples


### Data
  f <- 0.72
  s <- 0.8
  data(persistence)
  attach(persistence)
  sv <- persistence.prob(turbineID, perstime, status)$persistence.prob[,1]
  sv.lower <- persistence.prob(turbineID, perstime, status)$lower[,1]
  sv.upper <- persistence.prob(turbineID, perstime, status)$upper[,1]
  n <- 4
  d <- 3
  
### Constant search efficiency and constant persistence probability
  pkorner(s=s, f=f, d=d, n=n)
  pkorner(s=s, s.lower=0.6, s.upper=0.9, f=f, f.lower=0.6, f.upper=0.8, 
    d=d, n=n, CI=TRUE)

### Decreasing search efficiency and constant persistence probability
  pkorner(s=s, f=f, d=d, n=n, k=0.25, search.efficiency.constant=FALSE)

### Constant search efficiency and decreasing persistence probability
  pkorner(s=sv, f=f, d=d, n=n)

### Decreasing search efficiency and decreasing persistence probability
  pkorner(s=sv, f=f, d=d, n=n, search.efficiency.constant=FALSE)
  pkorner(s=sv, s.lower=sv.lower, s.upper=sv.upper, f=f, f.lower=0.6, 
    f.upper=0.8, d=d, n=n, search.efficiency.constant=FALSE, CI=TRUE)





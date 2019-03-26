library(strandCet)


### Name: mod
### Title: Heligman-Pollard parameter coversion to age-specific
###   probabilites of death.
### Aliases: mod
### Keywords: Heligman-Pollard bycatch mortality

### ** Examples


lifeN <- life.tab(cetaceans)

modSi <- Si.mod(data = cetaceans, rm = 2,
                par = c(0.3159462,  0.1860541, -1.2802880,  1.1733226,  0.0170314))

dataSi <- Si.pred(data = cetaceans, Sout = modSi, rm = 2)

priors <- data.frame(priors.lo = c(0,0.5,0,0,0,0,6,0,1),
                     priors.hi = c(0.1,1,1,0.15,0.15,50,10,0.01,1.5))

q0 <- HP.priors(pri.lo = priors$priors.lo,
                pri.hi = priors$priors.hi,
                theta.dim = 9)

HP.mod(prior = q0, lifeTab = lifeN, rm = 2, K = 10, d = 10, B = 10, CI = 90)





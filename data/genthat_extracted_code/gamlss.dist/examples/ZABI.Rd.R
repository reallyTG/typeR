library(gamlss.dist)


### Name: ZABI
### Title: Zero inflated and zero adjusted Binomial distribution for
###   fitting in GAMLSS
### Aliases: ZABI dZABI pZABI qZABI rZABI ZIBI dZIBI pZIBI qZIBI rZIBI
### Keywords: distribution regression

### ** Examples

ZABI() 
curve(dZABI(x, mu = .5, bd=10), from=0, to=10, n=10+1, type="h")
tN <- table(Ni <- rZABI(1000, mu=.2, sigma=.3, bd=10))
r <- barplot(tN, col='lightblue')

ZIBI() 
curve(dZIBI(x, mu = .5, bd=10), from=0, to=10, n=10+1, type="h")
tN <- table(Ni <- rZIBI(1000, mu=.2, sigma=.3, bd=10))
r <- barplot(tN, col='lightblue')




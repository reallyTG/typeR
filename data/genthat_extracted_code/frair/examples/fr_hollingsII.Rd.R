library(frair)


### Name: fr_hollingsII
### Title: Holling's Original Type II Response
### Aliases: fr_hollingsII hollingsII hollingsII_fit hollingsII_nll

### ** Examples

datx <- rep(c(1,2,3,4,6,12,24,50,100), times=10)
daty1 <- round(hollingsII(X=datx, 
            a=0.75*rnorm(length(datx), mean=1, sd=0.1), 
            h=0.1*rnorm(length(datx), mean=1, sd=0.1), 
            T=1),0)
daty2 <- round(hollingsII(X=datx, 
            a=0.75*rnorm(length(datx), mean=1, sd=0.1), 
            h=0.01*rnorm(length(datx), mean=1, sd=0.1), 
            T=1),0)
dat <- data.frame(datx,daty1,daty2)

hollII_1 <- frair_fit(daty1~datx, data=dat, response='hollingsII', 
        start=list(a=1, h=0.1), fixed=list(T=1))
hollII_2 <- frair_fit(daty2~datx, data=dat, response='hollingsII', 
        start=list(a=1, h=0.01), fixed=list(T=1))

plot(c(0,100), c(0,40), type='n', xlab='Density', ylab='No. Eaten')
points(hollII_1)
points(hollII_2, col=4)
lines(hollII_1)
lines(hollII_2, col=4)

frair_compare(hollII_1, hollII_2)




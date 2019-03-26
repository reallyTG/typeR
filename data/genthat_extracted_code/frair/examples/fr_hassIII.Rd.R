library(frair)


### Name: fr_hassIII
### Title: Hassell's Type III Response
### Aliases: fr_hassIII hassIII hassIII_fit hassIII_nll

### ** Examples

datx <- rep(c(1,2,3,4,6,12,24,50,100), times=10)
daty1 <- round(hassIII(X=datx, 
            b=0.08*rnorm(length(datx), mean=1, sd=0.1), 
            c=0.1*rnorm(length(datx), mean=1, sd=0.1), 
            h=0.1*rnorm(length(datx), mean=1, sd=0.1), 
            T=1),0)
daty2 <- round(hassIII(X=datx, 
            b=0.05*rnorm(length(datx), mean=1, sd=0.1), 
            c=0.1*rnorm(length(datx), mean=1, sd=0.1), 
            h=0.2*rnorm(length(datx), mean=1, sd=0.1), 
            T=1),0)
dat <- data.frame(datx,daty1,daty2)

hassIII_1 <- frair_fit(daty1~datx, data=dat, response='hassIII', 
        start=list(b=0.05, c=0.1, h=0.1), fixed=list(T=1))
hassIII_2 <- frair_fit(daty2~datx, data=dat, response='hassIII', 
        start=list(b=0.05, c=0.1, h=0.1), fixed=list(T=1))

plot(c(0,100), c(0,15), type='n', xlab='Density', ylab='No. Eaten')
points(hassIII_1)
points(hassIII_2, col=4)
lines(hassIII_1)
lines(hassIII_2, col=4)

frair_compare(hassIII_1, hassIII_2)





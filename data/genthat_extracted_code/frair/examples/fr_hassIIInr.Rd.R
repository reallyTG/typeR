library(frair)


### Name: fr_hassIIInr
### Title: Hassell's Type III Response, without replacement
### Aliases: fr_hassIIInr hassIIInr hassIIInr_fit hassIIInr_nll

### ** Examples

datx <- rep(c(1,2,3,4,6,12,24,50,100), times=10)
daty1 <- round(hassIIInr(X=datx, 
            b=0.08*rnorm(length(datx), mean=1, sd=0.1), 
            c=0.1*rnorm(length(datx), mean=1, sd=0.1), 
            h=0.08*rnorm(length(datx), mean=1, sd=0.1), 
            T=1),0)
daty2 <- round(hassIIInr(X=datx, 
            b=0.05*rnorm(length(datx), mean=1, sd=0.1), 
            c=0.08*rnorm(length(datx), mean=1, sd=0.1), 
            h=0.1*rnorm(length(datx), mean=1, sd=0.1), 
            T=1),0)
dat <- data.frame(datx,daty1,daty2)

hassIIInr_1 <- frair_fit(daty1~datx, data=dat, response='hassIIInr', 
        start=list(b=0.05, c=0.1, h=0.1), fixed=list(T=1))
hassIIInr_2 <- frair_fit(daty2~datx, data=dat, response='hassIIInr', 
        start=list(b=0.05, c=0.1, h=0.1), fixed=list(T=1))

plot(c(0,100), c(0,15), type='n', xlab='Density', ylab='No. Eaten')
points(hassIIInr_1)
points(hassIIInr_2, col=4)
lines(hassIIInr_1)
lines(hassIIInr_2, col=4)

frair_compare(hassIIInr_1, hassIIInr_2)




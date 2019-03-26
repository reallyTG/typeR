library(RSEIS)


### Name: setwelch
### Title: Set up Matrix of fft for Welch method
### Aliases: setwelch
### Keywords: misc

### ** Examples


  
dt <- 0.001

 t <- seq(0, 6, by=dt)
x <- 6*sin(2*pi*50*t) + 10* sin(2*pi*120*t)
 y <- x + rnorm(length(x), mean=0, sd=10)

plot(t,y, type='l')

title('sin(2*pi*50*t) + sin(2*pi*120*t)+ rnorm')

Y <- fft(y)

Pyy <- Y * Conj(Y)

N <- length(y)

n <- length(Pyy)/2

Syy <- (Mod(Pyy[1:n])^2)/N

fn <- 1/(2*dt)


f <- (0:(length(Syy)-1))*fn/length(Syy)

plot(f, Syy, type='l', log='y' , xlim=c(0, 150));
abline(v=c(50, 120),col='blue', lty=2)


plot(f, Syy, type='l', log='y' , xlim=c(0, 150));
abline(v=c(50, 120),col='blue', lty=2)


win <- 1024

inc <- min(24, floor(length(y)/30))
coef <- 2048


 w <- setwelch(y, win=win, inc=inc, coef=coef, wintaper=0.2)

    KK <- apply(w$values, 2, FUN="mean")


fw <- seq(from=0, to=0.5, length=coef)/(dt)

plot(fw, KK^2, log='', type='l' , xlim=c(0, 150)) ;
abline(v=c(50, 120), col='blue', lty=2)


Wyy <- (KK^2)/w$windowsize
plot(f, Syy, type='l', log='y' , xlim=c(0, 150))
lines(fw,Wyy , col='red')


DBSYY <- 20*log10(Syy/max(Syy))
DBKK <- 20*log10(Wyy/max(Wyy))


plot(f, DBSYY, type='l' , xlim=c(0, 150), ylab="Db", xlab="Hz")

lines(fw, DBKK, col='red')
title("Compare simple periodogam with Welch's Method")







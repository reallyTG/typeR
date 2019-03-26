library(kzfs)


### Name: kzft
### Title: Kolmogorov-Zurbenko Fourier Transform Function
### Aliases: kzft kz.ft kzft kz.ftc
### Keywords: KZFT

### ** Examples

## Adapted from kzft::kzp example 2
t <- 1:2000
y <- 1.1*sin(2*pi*0.0339*t)+7*sin(2*pi*0.0366*t)
y2 <- y
noise <- rnorm(length(t),0,1)
y[sample(t,100,replace=FALSE)] <- NA
f <- c(0.0339, 0.0366)

## Periodogram
ft <- kz.ft(y+5*noise, f=f, k=2, m=1000, n=10)
# It may take 10 ~ 20 seconds
# system.time(ft <- kz.ft(y+5*noise, k=2, m=1000, n=10)) 
plot(y=log(ft$pg+1), x=ft$f, type="l", xlim=c(0.025,0.045))
abline(v=f, lty=21, col="red")
text(x=f+0.001, y=c(2,4), f, col="red", cex=0.75)

## recover signal
ft <- kz.ft(y+5*noise, f=f, k=3, m=500)
yr <- 2*Re(rowSums(ft$tf))
cor(yr, y2[1:length(yr)], use="pairwise.complete.obs")
plot((y+5*noise)[1:length(yr)], type="p", cex=0.5, col="grey")
points(y[1:length(yr)],type="b", col="red", cex=0.45)
points(yr, type="p", cex=0.35, col="blue")
mtext("Red dots: singal, Blue dots: reconstruction", cex=0.75)


## Additional example
t <- 1:2000
y <- 1.1*sin(2*pi*0.011*t)+2*sin(2*pi*0.032*t)
y2 <- y
y[sample(t,500,replace=FALSE)] <- NA
noise <- rnorm(2000,0,1)
ft <- kz.ft(y + 3.0*noise, k=5, f=c(0.011,0.032), m=300, adpt=FALSE)
yr <- 2*Re(rowSums(ft$tf))
cor(yr, y2[1:length(yr)], use="pairwise.complete.obs")
plot((y+5*noise)[1:length(yr)], type="p", col="grey")
points(y2[1:length(yr)], type="l", col="red")
points(y[1:length(yr)],type="p", col="red", cex=0.35)
points(yr, type="p", cex=0.3, col="blue")
mtext("Red: singal, Grey: singal + 5*noise, Blue: reconstruction", cex=0.75)


## Example for kz.ftc

t <- runif(2000)*2000
f <- c(0.15, 0.1)
x <- sin(2*pi*f[1]*t + pi/4)
y <- sin(2*pi*f[2]*t + pi/12)
y <- y[order(t)]
x <- x[order(t)]
tr <- t[order(t)]
noise <- rnorm(length(tr),0,1)
plot(y=y+x, x=tr, type="l")

## Periodogram
ft <- kz.ftc(x+y+2*noise, xt=tr, k=2, m=1000)
plot(y=ft$pg, x=ft$f, type="l")
abline(v=f, col="grey", lty=21)
text(x=f+0.001, y=c(200,400), f, col="red", cex=0.75)
mtext("Spectrum of Longitudinal Data, Selected f")

## recover signal
ft <- kz.ftc(x+y+noise, xt=tr, f=f, k=1, m=1900)
yr <- rowSums(2*Re(ft$tf))
iv <- 0:60
plot(y=(x+y+noise)[iv], x=tr[iv], type="p", col="grey")
xt <- (0:8000)/100
yt <- sin(2*pi*f[1]*xt+pi/4) + sin(2*pi*f[2]*xt+pi/12)
y2 <- sin(2*pi*f[1]*iv+pi/4) + sin(2*pi*f[2]*iv+pi/12)
points(yt, x=xt, col="grey", cex=0.5, lwd=1, type="l")
points(y2, x=iv, col="blue", cex=0.75, lwd=1, type="p")
points(y=yr, x=0:(length(yr)-1), type="p", cex=0.5, lwd=1, col="red")
mtext("Red: reconstruction, Grey: signal + noise", cex=0.75)





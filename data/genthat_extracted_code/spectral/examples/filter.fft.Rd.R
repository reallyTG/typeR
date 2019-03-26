library(spectral)


### Name: filter.fft
### Title: Filter in the frequency domain
### Aliases: filter.fft

### ** Examples

## noisy signal with amplitude modulation
x <- seq(0,1, length.out=500)

# original data
y_org <- (1+sin(2*2*pi*x))*sin(20*2*pi*x)

# overlay some noise
y_noise <- y_org+rnorm(length(x),sd=0.2)

# filter the noisy data
y_filt <- filter.fft(y_noise,x,fc=20,BW=4,n=50)

# plot results
plot(x,y_noise,type="l",lwd=1,col="darkgrey",lty=2,ylab="y",main="Spectral filtering")
lines(x,y_org,lwd=5,col="grey")
lines(x,y_filt)
legend("topright",c("org","noisy","filtered"),col=c("grey","darkgrey","black")
        ,lty=c(1,2,1),lwd=c(5,1,1))




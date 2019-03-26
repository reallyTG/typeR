library(bspec)


### Name: tukeywindow
### Title: Compute windowing functions for spectral time series analysis.
### Aliases: tukeywindow squarewindow hannwindow welchwindow trianglewindow
###   hammingwindow cosinewindow kaiserwindow
### Keywords: ts

### ** Examples

# illustrate the different windows' shapes:
N <- 100
matplot(1:N,
        cbind(cosinewindow(N),
              hammingwindow(N),
              hannwindow(N),
              kaiserwindow(N),
              squarewindow(N),
              trianglewindow(N),
              tukeywindow(N,r=0.5),
              welchwindow(N)),
        type="l", lty="solid", col=1:8)
legend(N, 0.99, legend=c("cosine","hamming","hann","kaiser",
                         "square","triangle","tukey","welch"),
       col=1:8, lty="solid", xjust=1, yjust=1, bg="white")

# show their effect on PSD estimation:
data(sunspots)



spec1 <- welchPSD(sunspots, seglength=10, windowfun=squarewindow)
plot(spec1$frequency, spec1$power, log="y", type="l")

spec2 <- welchPSD(sunspots, seglength=10, windowfun=tukeywindow, r=0.25)
lines(spec2$frequency, spec2$power, log="y", type="l", col="red")

spec3 <- welchPSD(sunspots, seglength=10, windowfun=trianglewindow)
lines(spec3$frequency, spec3$power, log="y", type="l", col="green")




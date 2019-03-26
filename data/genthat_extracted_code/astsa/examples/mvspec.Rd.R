library(astsa)


### Name: mvspec
### Title: Univariate and Multivariate Spectral Estimation
### Aliases: mvspec
### Keywords: ts

### ** Examples

# univariate example
plot(co2)   # co2 is an R data set
mvspec(co2, spans=c(5,5), taper=.5)

# multivariate example
ts.plot(mdeaths, fdeaths, col=1:2)   # an R data set, male/female monthly deaths ...
dog = mvspec(cbind(mdeaths,fdeaths), spans=c(3,3), taper=.1)
dog$fxx        # look a spectral matrix estimates
dog$bandwidth  # bandwidth with time unit = year
dog$bandwidth/frequency(mdeaths)  # ... with time unit = month
plot(dog, plot.type="coherency")  # plot of squared coherency




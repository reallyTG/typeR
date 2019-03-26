library(geofd)


### Name: okfd
### Title: Function for doing Ordinary Kriging for function-value Data
### Aliases: okfd geofd.okfd
### Keywords: spatial datagen smooth

### ** Examples


# First example: one site prediction using B-splines for smoothing

data(maritimes.avg)
data(maritimes.coords)
data(maritimes.data)

coord.cero <- matrix(c(-64.06, 45.79),nrow=1,ncol=2)

n<-dim(maritimes.data)[1]

argvals<-seq(1,n, by=1)

# Prediction by okfd

okfd.res<-okfd(new.coords=coord.cero, coords=maritimes.coords,
              data=maritimes.data, nbasis=65, argvals=argvals,
              fix.nugget=TRUE, kappa=0.7)

# Smoothed and predicted curves, and predicted site average values are plotted

plot(okfd.res$datafd, lty=1, col=8,
    main="Smoothed", xlab="Day", ylab="Temperature (Degrees C)")

lines(okfd.res$argvals, okfd.res$krig.new.data,
      col=1, lwd=2, type="l", lty=1,
      main="Predictions", xlab="Day", ylab="Temperature (Degrees C)")

lines(maritimes.avg,  type="p", pch=20,cex=0.5, col=2, lwd=1)

# Second example: multiple sites prediction using Fourier basis functions for smoothing

data(maritimes)

n<-dim(maritimes.data)[1]

argvals<-seq(1,n, by=1)

col1<-sample( (min(maritimes.coords[,1])*100):(max(maritimes.coords[,1])*100),
              10, replace=TRUE)/100

col2<-sample( (min(maritimes.coords[,2])*100):(max(maritimes.coords[,2])*100),
              10, replace=TRUE)/100

new.coords <- cbind(col1,col2)

# Prediction by okfd

okfd.res<-okfd(new.coords=new.coords, coords=maritimes.coords,
              data=maritimes.data, smooth.type="fourier",
              nbasis=65, argvals=argvals)

# The smoothed and predicted curves are plotted

par(mfrow=c(1,2))

plot(okfd.res$datafd, lty=1, col=8,
    main="Smoothed", xlab="Day", ylab="Temperature (Degrees C)")

matplot(okfd.res$argvals, okfd.res$krig.new.data, col=1, lwd=1, type="l", lty=1,
        main="Predictions", xlab="Day", ylab="Temperature (Degrees C)")





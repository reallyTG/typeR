library(kzft)


### Name: kzft
### Title: Kolmogorov-Zurbenko Fourier Transform
### Aliases: kzft coeff.kzft transfun.kzft
### Keywords: ts

### ** Examples


# example 1
# coefficient of the kzft(201,5)

aa<-coeff.kzft(201,5);
tt<-seq(1:1001)-501;
zz<-cos(2*pi*0.025*tt);
plot(zz*aa,type="l",xlab="Time unit", ylab="The coefficient", 
    main="Coefficients of the kzft");
lines(aa);
lines(-1*aa);

# example 2
# transfer function of the kzft(201,5) at frequency 0.025

lamda<-seq(-0.1,0.1,by=0.001)
tf1<-transfun.kzft(201,1,lamda,0.025)
tf2<-transfun.kzft(201,5,lamda,0.025)
matplot(lamda,cbind(log(tf1),log(tf2)),type="l",ylim=c(-15,0),ylab="Natural log transformation of the coefficients", xlab="Frequency (cycles/time unit)",
        main="Transfer function of kzft(201,5) at frequency 0.025")

#example 3
#The example shows the KZFT reproduces nearly perfectly the noise-free pattern of a sin wave with a constant frequency

# raw time series with frequency of 0.01
t<-1:1000
x<-cos(2*pi*(10/1000)*t)

#kzft(200,1) calcualted every one time unit at freuquency 0.01
kzft.x1<-kzft(x,200,1,0.005)
x1<-2*Re(kzft.x1$tf[,2])

#kzft(200,2) calcualted every one time unit at freuquency 0.01
kzft.x2<-kzft(x,200,2,0.005/2)
x2<-2*Re(kzft.x2$tf[,2])

#kzft(200,3) calcualted every one time unit at freuquency 0.01
kzft.x3<-kzft(x,200,3,0.005/3)
x3<-2*Re(kzft.x3$tf[,2])

par(mfrow=c(2,2))
plot(x,type="l",main="Original time series",xlab="Time unit", ylab="Amplitude")
plot(x1,type="l",main="kzft(200,1)",xlab="Time unit", ylab="Amplitude")
plot(x2,type="l",main="kzft(200,2)",xlab="Time unit", ylab="Amplitude")
plot(x3,type="l",main="kzft(200,3)",xlab="Time unit", ylab="Amplitude")

#example 4
#The example shows the KZFT reproduces nearly perfectly the noise-free pattern of a cos wave with a constant frequency

# raw time series with frequency of 0.01
t<-1:1000
x<-sin(2*pi*(10/1000)*t)

#kzft(200,1) calcualted every one time unit at freuquency 0.01
kzft.x1<-kzft(x,200,1,0.005)
x1<-2*Re(kzft.x1$tf[,2])

#kzft(200,2) calcualted every one time unit at freuquency 0.01
kzft.x2<-kzft(x,200,2,0.005/2)
x2<-2*Re(kzft.x2$tf[,2])

#kzft(200,3) calcualted every one time unit at freuquency 0.01
kzft.x3<-kzft(x,200,3,0.005/3)
x3<-2*Re(kzft.x3$tf[,2])

par(mfrow=c(2,2))
plot(x,type="l",main="Original time series",xlab="Time unit", ylab="Amplitude")
plot(x1,type="l",main="kzft(200,1)",xlab="Time unit", ylab="Amplitude")
plot(x2,type="l",main="kzft(200,2)",xlab="Time unit", ylab="Amplitude")
plot(x3,type="l",main="kzft(200,3)",xlab="Time unit", ylab="Amplitude")





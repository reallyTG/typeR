library(kza)


### Name: kzft
### Title: Kolmogorov-Zurbenko Fourier Transform
### Aliases: kzft coeff max_freq transfer_function

### ** Examples

# example taken from Wei Yang's KZFT package
# coefficients of kzft(201,5)

# function to calculate polnomial coefficients for kzft
## Not run: 
##D a<-coeff(201,5);
##D t<-seq(1:1001)-501;
##D z<-cos(2*pi*0.025*t);
##D plot(z*a,type="l",xlab="Time", ylab="Coefficient", main="Coefficients of the kzft");
##D lines(a);
##D lines(-1*a);
## End(Not run)

# example taken from Wei Yang's KZFT package
# transfer function of the kzft(201,5) at frequency 0.025
lamda<-seq(-0.1,0.1,by=0.001)
tf1<-transfer_function(201,1,lamda,0.025)
tf2<-transfer_function(201,5,lamda,0.025)
matplot(lamda,cbind(log(tf1),log(tf2)),type="l",ylim=c(-15,0),
	ylab="Natural log transformation of the coefficients", 
	xlab="Frequency (cycles/time unit)",
    main="Transfer function of kzft(201,5) at frequency 0.025")

# example with missing values
set.seed(2)
period=101
f<-1/period
t<-1:2000
s<-1*sin(2*pi*f*t)
x<-s
noise<-3*rnorm(length(t))
x<-s+noise
m=101

rand_idx <- sample(t,100,replace=FALSE)
x[rand_idx]<-NA
x<-as.vector(na.omit(x))

system.time(z1<-kzft(x, m=m, k=1, f=f))
system.time(z2<-kzft(x, m=m, k=2, f=f))
system.time(z3<-kzft(x, m=m, k=3, f=f))

par(mfrow=c(2,2))
plot(x,type="l",main="Original time series",xlab="t", ylab="y")
lines(s,col="blue")
plot(2*Re(z1),type="l",main="kzft(101,1)",xlab="t", ylab="y", ylim=c(-6,6))
lines(s,col="blue")
plot(2*Re(z2),type="l",main="kzft(101,2)",xlab="t", ylab="y", ylim=c(-6,6))
lines(s,col="blue")
plot(2*Re(z3),type="l",main="kzft(101,3)",xlab="t", ylab="y", ylim=c(-6,6))
lines(s,col="blue")
par(mfrow=c(1,1))




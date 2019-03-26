library(QRegVCM)


### Name: AHeVXT
### Title: AHe V(X(t),t)-approach
### Aliases: AHeVXT

### ** Examples

data(PM10)

PM10 = PM10[order(PM10$day,PM10$hour,decreasing=FALSE),]

y = PM10$PM10[1:200]
times = PM10$hour[1:200]
subj = PM10$day[1:200]
dim = length(y)
x0 = rep(1,200)
x1 = PM10$cars[1:200]
x2 = PM10$wind.speed[1:200]

X = cbind(x0, x1, x2)

VecX = c(1, max(x1), max(x2))

##########################
#### Input parameters ####
##########################
kn = c(10, 10, 10)
degree = c(3, 3, 3)
taus = seq(0.1,0.9,0.1)
lambdas = c(1,1.5,2)
d = c(1, 1, 1)
gam = 1/2
##########################

AHe = AHeVXT(VecX=VecX, times=times, subj=subj, X=X, y=y, d=d,
      tau=taus,  kn=kn, degree=degree, lambda=lambdas, gam=gam)
hat_bt50 = AHe$hat_bt50
hat_gt50 = AHe$hat_gt50
hat_VXT = AHe$hat_VXT
C = AHe$C
qhat = AHe$qhat

qhat1 = qhat[,1]
qhat2 = qhat[,2]
qhat3 = qhat[,3]
qhat4 = qhat[,4]
qhat5 = qhat[,5]
qhat6 = qhat[,6]
qhat7 = qhat[,7]
qhat8 = qhat[,8]
qhat9 = qhat[,9]

hat_bt0 = hat_bt50[seq(1,dim)]
hat_bt1 = hat_bt50[seq((dim+1),(2*dim))]
hat_bt2 = hat_bt50[seq((2*dim+1),(3*dim))]

hat_gt0 = hat_gt50[seq(1,dim)]
hat_gt1 = hat_gt50[seq((dim+1),(2*dim))]
hat_gt2 = hat_gt50[seq((2*dim+1),(3*dim))]

i = order(times, hat_VXT, qhat1, qhat2, qhat3, qhat4, qhat5, qhat6, qhat7,
    qhat8, qhat9,
hat_bt0, hat_bt1, hat_bt2, hat_gt0, hat_gt1, hat_gt2);
times = times[i]; hat_VXT=hat_VXT[i]; qhat1 = qhat1[i]; qhat2=qhat2[i];
qhat3=qhat3[i]; qhat4=qhat4[i]; qhat5=qhat5[i]; qhat6=qhat6[i];
qhat7=qhat7[i]; qhat8=qhat8[i]; qhat9=qhat9[i];
hat_bt0=hat_bt0[i];  hat_bt1=hat_bt1[i];  hat_bt2=hat_bt2[i];
hat_gt0=hat_gt0[i];  hat_gt1=hat_gt1[i];  hat_gt2=hat_gt2[i];


### Plot coefficients

plot(hat_bt0~times, lwd=2, type="l", xlab="hour", ylab="baseline PM10");
plot(hat_bt1~times, lwd=2, type="l", xlab="hour",
    ylab="coefficient of cars");
plot(hat_bt2~times, lwd=2, type="l", xlab="hour",
    ylab="coefficient of wind");

###
plot(hat_gt0~times, lwd=2, type="l", xlab="hour", ylab="baseline PM10");
plot(hat_gt1~times, lwd=2, type="l", xlab="hour",
    ylab="coefficient of cars");
plot(hat_gt2~times, lwd=2, type="l", xlab="hour",
    ylab="coefficient of wind");

### Plot variability V(X(t),t)

plot(hat_VXT~times, ylim=c(min(hat_VXT), max(hat_VXT)), xlab="hour", ylab="");
mtext(expression(hat(V)(X(t),t)), side=2, cex=1, line=3)

### Plot conditional quantiles estimators

ylim = range(qhat1, qhat9)
ylim = c(-4, 6)
plot(qhat1~times, col="magenta", cex=0.2, lty=5, lwd=2, type="l", ylim=ylim,
    xlab="hour", ylab="PM10");
lines(qhat2~times, col="aquamarine4", cex=0.2, lty=4, lwd=2);
lines(qhat3~times, col="blue", cex=0.2, lty=3, lwd=3);
lines(qhat4~times, col="brown", cex=0.2, lty=2, lwd=2);
lines(qhat5~times, col="black", cex=0.2, lty=1, lwd=2);
lines(qhat6~times, col="orange", cex=0.2, lty=2, lwd=2)
lines(qhat7~times, col="darkcyan", cex=0.2, lty=3, lwd=3);
lines(qhat8~times, col="green", cex=0.2, lty=4, lwd=2);
lines(qhat9~times, col="red", cex=0.2, lty=5, lwd=3)

legend("bottom", c(expression(tau==0.9), expression(tau==0.8),
      expression(tau==0.7), expression(tau==0.6), expression(tau==0.5),
      expression(tau==0.4), expression(tau==0.3), expression(tau==0.2),
      expression(tau==0.1)), ncol=3, col=c("red","green","darkcyan","orange",
      "black","brown","blue","aquamarine4","magenta"), lwd=c(2,2,3,2,2,2,3,2,2),
      lty=c(5,4,3,2,1,2,3,4,5))










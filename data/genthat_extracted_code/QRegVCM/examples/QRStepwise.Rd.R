library(QRegVCM)


### Name: QRStepwise
### Title: Stepwise procedure
### Aliases: QRStepwise

### ** Examples

data(PM10)

PM10 = PM10[order(PM10$day,PM10$hour,decreasing=FALSE),]

y = PM10$PM10[1:200]
time_ub = PM10$hour[1:200]
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
gam = 1
##########################


Step = QRStepwise(VecX=VecX, tau=taus, time_ub, subj, X, y, d, kn, degree,
       lambda=lambdas, gam=gam)

qhat = Step$qhat

qhat1 = qhat[,1]
qhat2 = qhat[,2]
qhat3 = qhat[,3]
qhat4 = qhat[,4]
qhat5 = qhat[,5]
qhat6 = qhat[,6]
qhat7 = qhat[,7]
qhat8 = qhat[,8]
qhat9 = qhat[,9]


i = order(time_ub, y, qhat1, qhat2, qhat3, qhat4, qhat5, qhat6, qhat7,
    qhat8, qhat9);

time_ub = time_ub[i]; y = y[i]; qhat1 = qhat1[i]; qhat2=qhat2[i];
qhat3=qhat3[i]; qhat4=qhat4[i]; qhat5=qhat5[i]; qhat6=qhat6[i];
qhat7=qhat7[i]; qhat8=qhat8[i]; qhat9=qhat9[i];

ylim = range(qhat1, qhat9)
ylim = c(-4, 6)
plot(qhat1~time_ub, col="magenta", cex=0.2, lty=5, lwd=2, type="l", ylim=ylim,
    xlab="hour", ylab="PM10");
lines(qhat2~time_ub, col="aquamarine4", cex=0.2, lty=4, lwd=2);
lines(qhat3~time_ub, col="blue", cex=0.2, lty=3, lwd=3);
lines(qhat4~time_ub, col="brown", cex=0.2, lty=2, lwd=2);
lines(qhat5~time_ub, col="black", cex=0.2, lty=1, lwd=2);
lines(qhat6~time_ub, col="orange", cex=0.2, lty=2, lwd=2)
lines(qhat7~time_ub, col="darkcyan", cex=0.2, lty=3, lwd=3);
lines(qhat8~time_ub, col="green", cex=0.2, lty=4, lwd=2);
lines(qhat9~time_ub, col="red", cex=0.2, lty=5, lwd=3)

legend("bottom", c(expression(tau==0.9), expression(tau==0.8),
    expression(tau==0.7), expression(tau==0.6), expression(tau==0.5),
    expression(tau==0.4), expression(tau==0.3), expression(tau==0.2),
    expression(tau==0.1)), ncol=1, col=c("red","green","darkcyan",
    "orange","black","brown","blue","aquamarine4","magenta"),
    lwd=c(2,2,3,2,2,2,3,2,2), lty=c(5,4,3,2,1,2,3,4,5))







library(fda.usc)


### Name: min.np
### Title: Smoothing of functional data using nonparametric kernel
###   estimation
### Aliases: min.np
### Keywords: nonparametric

### ** Examples


# Exemple, phoneme DATA
data(phoneme)
mlearn<-phoneme$learn[1:100]

out1<-min.np(mlearn,type.CV=CV.S,type.S=S.NW)
np<-ncol(mlearn)
# variance calculations
y<-mlearn
out<-out1
i<-1
z=qnorm(0.025/np)
fdata.est<-out$fdata.est
tt<-y[["argvals"]]
var.e<-Var.e(y,out$S.opt)
var.y<-Var.y(y,out$S.opt)
var.y2<-Var.y(y,out$S.opt,var.e)

# plot estimated fdata and point confidence interval
upper.var.e<-fdata.est[i,]-z*sqrt(diag(var.e))
lower.var.e<-fdata.est[i,]+z*sqrt(diag(var.e))
dev.new()
plot(y[i,],lwd=1,
ylim=c(min(lower.var.e$data),max(upper.var.e$data)),xlab="t")
lines(fdata.est[i,],col=gray(.1),lwd=1)
lines(fdata.est[i,]+z*sqrt(diag(var.y)),col=gray(0.7),lwd=2)
lines(fdata.est[i,]-z*sqrt(diag(var.y)),col=gray(0.7),lwd=2)
lines(upper.var.e,col=gray(.3),lwd=2,lty=2)
lines(lower.var.e,col=gray(.3),lwd=2,lty=2)
legend("bottom",legend=c("Var.y","Var.error"),
col = c(gray(0.7),gray(0.3)),lty=c(1,2))





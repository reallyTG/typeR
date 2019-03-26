library(GORCure)


### Name: GORMC
### Title: Fitting the GORMC model with interval censored data.
### Aliases: GORMC
### Keywords: GORMC model Interval censoring

### ** Examples

data(Hemophilia)
head(Hemophilia)
# Set Left/Right Interval End Points as NA
Hemophilia$L[Hemophilia$d1==1]<-Hemophilia$R[Hemophilia$d3==1]<-NA

# Fit PHMC Model (r=0)
fit<-GORMC(survfun=Surv(L,R)~Low+Medium+High,curefun=~Low+Medium+High,
data=Hemophilia,r=0)
summary(fit)

# Fit POMC Model (r=1)
# fit<-GORMC(survfun=Surv(L,R)~Low+Medium+High,curefun=~Low+Medium+High,
# data=Hemophilia,r=1)
# summary(fit)

# Predict Cure Rate and Survival Curve for a New Individual
# Specify coveriate vectors for new.z and new.x
pred1<-predict(fit,new.z=c(1,0,0,0),new.x=c(0,0,0))
pred2<-predict(fit,new.z=c(1,1,0,0),new.x=c(1,0,0))
pred3<-predict(fit,new.z=c(1,0,1,0),new.x=c(0,1,0))
pred4<-predict(fit,new.z=c(1,0,0,1),new.x=c(0,0,1))

# Obtain Cure Rates
pred1$CureRate
pred2$CureRate
pred3$CureRate
pred4$CureRate

# Plot the Survival Curves
plot(pred1,xlab="Time",ylab="Survival Probability",ylim=c(0,1))
lines(pred2$Survival,col=2)
lines(pred3$Survival,col=3)
lines(pred4$Survival,col=4)
legend(0,0.3,c("None","Low","Medium","High"),lty=1,col=1:4)

# Not run: Grid Search r
# rr<-seq(0,2,0.2)
# logl<-numeric()
# for(i in 1:length(rr)){
# fit<-GORMC(survfun=Surv(L,R)~Low+Medium+High,curefun=~Low+Medium+High,
# data=Hemophilia,r=rr[i])
# logl[i]<-fit$ParEst$loglik
# }
# plot(rr,logl,type="l",xlab="r",ylab="Log-likelihood")




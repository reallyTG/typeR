library(ICGOR)


### Name: GORH
### Title: The Main Function to Fit the GORH Model with Interval Censored
###   Data.
### Aliases: GORH

### ** Examples

data(Hemophilia)
# Set Left/Right Interval End Points as NA
Hemophilia$L[Hemophilia$d1==1]<-Hemophilia$R[Hemophilia$d3==1]<-NA
# Fit PO Model (r=1)
fit<-GORH(Surv(L,R)~Low+Medium+High,data=Hemophilia,r=1)
summary(fit)

# Predict Survival Curve for a New Individual
# Specify coveriate vectors for new.x
pred1<-predict(fit,new.x=c(0,0,0))
pred2<-predict(fit,new.x=c(1,0,0))
pred3<-predict(fit,new.x=c(0,1,0))
pred4<-predict(fit,new.x=c(0,0,1))

# Plot the Survival Curves
plot(pred1,xlab="Time",ylab="Survival Probability",ylim=c(0,1))
lines(pred2$SurvTime,pred2$SurvProb,col=2)
lines(pred3$SurvTime,pred3$SurvProb,col=3)
lines(pred4$SurvTime,pred4$SurvProb,col=4)
legend(0,0.2,c("None","Low","Medium","High"),lty=1,col=1:4)




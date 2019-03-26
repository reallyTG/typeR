library(IPWsurvival)


### Name: adjusted.KM
### Title: Adjusted Survival Curves by Using IPW and Kaplan-Meier
###   Estimators.
### Aliases: adjusted.KM

### ** Examples


data(DIVAT)

# Kaplan-Meier estimator
res.km <- adjusted.KM(times=DIVAT$times, failures=DIVAT$failures,
  variable=DIVAT$ecd, weights=NULL)
plot(NULL,xlim=c(0,13),ylim=c(0,1),ylab="Graft and patient survival",
 xlab="Time post-transplantation (years)")
lines(res.km$times[res.km$variable==1], res.km$survival[res.km$variable==1],
type="s",col=2,lty=2,lwd=2)
lines(res.km$times[res.km$variable==0], res.km$survival[res.km$variable==0],
type="s",col=1,lty=2,lwd=2)

# adjusted Kaplan-Meier estimator by IPW
Pr0 <- glm(ecd ~ 1, family = binomial(link="logit"), data=DIVAT)$fitted.values[1]
Pr1 <- glm(ecd ~ age + hla + retransplant, data=DIVAT,
 family=binomial(link = "logit"))$fitted.values
W <- (DIVAT$ecd==1) * (1/Pr1) + (DIVAT$ecd==0) * (1)/(1-Pr1)
res.akm <- adjusted.KM(times=DIVAT$times, failures=DIVAT$failures,
 variable=DIVAT$ecd, weights=W)
lines(res.akm$times[res.akm$variable==1], res.akm$survival[res.akm$variable==1],
 type="s",col=2,lwd=2)
lines(res.akm$times[res.akm$variable==0], res.akm$survival[res.akm$variable==0],
 type="s",col=1,lwd=2)

nb.risk1<-function(x) {sum(DIVAT$times[DIVAT$ecd==0]>x)}
nb.risk2<-function(x) {sum(DIVAT$times[DIVAT$ecd==1]>x)}
segments(x0=0, y0=0.1, x1=13, y1=0.1) 
text(x=6, y=0.12, "number of at-risk patients", cex=0.8)
tps <- seq(1,12,by=1)
text(x=tps, y=rep(0.07,length(tps)), as.character(sapply(tps, FUN="nb.risk1")),
 cex=0.8, col=1)
text(x=tps, y=rep(0.02,length(tps)), as.character(sapply(tps, FUN="nb.risk2")),
 cex=0.8, col=2)
legend("topright", legend=c("Unadjusted estimator for SCD",
 "Adjusted estimator for SCD", "Unadjusted estimator for ECD",
 "Adjusted estimator for ECD"), col=c(1,1,2,2),
 lty=c(2,1,2,1), lwd=2, cex=0.8)




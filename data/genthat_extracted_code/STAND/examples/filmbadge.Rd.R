library(STAND)


### Name: filmbadge
### Title: Quarterly Film Badge Data
### Aliases: filmbadge
### Keywords: datasets

### ** Examples

data(filmbadge)
head(filmbadge)  #  LOOK AT FIRST FIVE RECORDS
#   USE icfit() TO CALCULATE PLE FOR INTERVAL CENSORED DATA
par( mfrow=c(1,2) )
out <- icfit(filmbadge$dlow,filmbadge$dhigh)
#   PLOT EXCEEDANCE S(x) vs x USING icplot()
tp <- "PLE of Exceedance for Filmbadge Data" 
icplot(out$surv, out$time,XLAB="Dose",YLAB="Exceedance Probability",main=tp,cex.main=.8)
#   USE pleicf() TO CALCULATE PLE FOR filmbadge DATA
ple.fb <- pleicf(filmbadge[,1:2],FALSE)
#   USE qq.lnorm  FOR LOGNORMAL Q-Q PLOT FOR INTERVAL CENSORED DATA
tmp <- qq.lnorm(ple.fb)  
GM <-round(exp(tmp$par[1])); GSD <- round(exp(tmp$par[2]),2)
tp<-paste("Lognormal Q-Q plot for Filmbadge\n  Data GM= ",GM,"GSD= ",GSD)
title(tp,cex.main=0.8) # title for q-q plot with graphical parameter estimates
#  RESULTS FROM  pleicf()
round(ple.fb,3)
#





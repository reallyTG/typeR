library(bpcp)


### Name: plot.kmciLR
### Title: Plot and lines methods for 'kmci' and 'kmciLR' objects.
### Aliases: plot.kmci plot.kmciLR lines.kmci lines.kmciLR
### Keywords: survival

### ** Examples

data(leuk)
## kmciTG creates kmci object
fitTG<-kmciTG(leuk$time,leuk$status)
plot(fitTG)
## bpcp creates kmciLR object 
fitBP<-bpcp(leuk$time,leuk$status)
lines(fitBP,lwd=3,lty=1,col=gray(.5))
legend(0,.2,legend=c("Kaplan-Meier","Thomas-Grunkemeier 95 pct CI","Beta Product 95 pct CI"),
    lwd=c(1,1,3),lty=c(1,2,1),col=c(gray(0),gray(.8),gray(.5)))




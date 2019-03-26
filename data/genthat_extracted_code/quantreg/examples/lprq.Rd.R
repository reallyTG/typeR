library(quantreg)


### Name: lprq
### Title: locally polynomial quantile regression
### Aliases: lprq
### Keywords: smooth robust

### ** Examples

require(MASS)
data(mcycle)
attach(mcycle)
plot(times,accel,xlab = "milliseconds", ylab = "acceleration (in g)")
hs <- c(1,2,3,4)
for(i in hs){
        h = hs[i]
        fit <- lprq(times,accel,h=h,tau=.5)
        lines(fit$xx,fit$fv,lty=i)
        }
legend(50,-70,c("h=1","h=2","h=3","h=4"),lty=1:length(hs))




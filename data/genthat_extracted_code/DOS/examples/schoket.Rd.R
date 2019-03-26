library(DOS)


### Name: schoket
### Title: DNA Damage in Aluminum Production Workers
### Aliases: schoket
### Keywords: datasets

### ** Examples

data(schoket)
attach(schoket)
plot(sort(adductsc),sort(adductsw),ylim=c(0,6.4),xlim=c(0,6.4),
   xlab="DNA adducts for controls",ylab="DNA adducts for workers",
   main="Quantile-Quantile Plot") # Compare with Chapter 16
abline(0,1) # line of equality
legend(4,1,lty=1,"x=y")
boxplot(adductsw,adductsc,ylim=c(0,6.4),ylab="DNA adducts",names=c("Worker","Control"))
d<-adductsw-adductsc
senWilcox(d,gamma=1)
senWilcox(d,gamma=1.5) # sensitive to gamma=1.5




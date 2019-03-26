library(PK)


### Name: test
### Title: Function for hypothesis testing for objects of class PK
### Aliases: test print.PKtest summary.PKtest
### Keywords: htest

### ** Examples

## example for a serial sampling data design from Wolfsegger and Jaki (2009)
conc <- c(0, 0, 0, 2.01, 2.85, 2.43, 0.85, 1.00, 0.91, 0.46, 0.35, 0.63, 0.39, 0.32, 
          0.45, 0.11, 0.18, 0.19, 0.08, 0.09, 0.06)
time <- c(rep(0,3), rep(5/60,3), rep(3,3), rep(6,3), rep(9,3), rep(16,3), rep(24,3))

obj <- nca(conc=conc, time=time, n.tail=4, dose=200, method="z", 
            conf.level=0.95, design="ssd")

## testing all parameters against different values using a z-test
res <- test(obj, theta=c(11, 12, 90, 7, 5, 16, 120), method="z")

print(res)

## a batch design example from Holder et al. (1999).
data(Rats)
data <- subset(Rats,Rats$dose==100)

obj <- auc(data=data,method=c('z','t'), design='batch')

## t-test
res <- test(obj, theta=100, method="t")

## making the hypothesis explicit
summary(res)

## bootstrap test for bioequivalence
# Note: This can take a few seconds
data(Glucose)
## one-sided permutation test
obj <- auc(conc=Glucose$conc, time=Glucose$time, group=Glucose$date, 
     method=c("t"), conf.level=0.90, alternative='less', 
     nsample=100, design="complete")

test(obj, theta=1, method="resample", nsample=100)





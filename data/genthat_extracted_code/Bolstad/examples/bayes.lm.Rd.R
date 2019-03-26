library(Bolstad)


### Name: bayes.lm
### Title: Bayesian inference for multiple linear regression
### Aliases: bayes.lm
### Keywords: misc

### ** Examples

data(bears)
bears = subset(bears, Obs.No==1)
bears = bears[,-c(1,2,3,11,12)]
bears = bears[ ,c(7, 1:6)]
bears$Sex = bears$Sex - 1
log.bears = data.frame(log.Weight = log(bears$Weight), bears[,2:7])

b0 = rep(0, 7)
V0 = diag(rep(1e6,7))

fit = bayes.lm(log(Weight)~Sex+Head.L+Head.W+Neck.G+Length+Chest.G, data = bears,
               prior = list(b0 = b0, V0 = V0))
summary(fit)
print(fit)


## Dobson (1990) Page 9: Plant Weight Data:
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)

lm.D9 <- lm(weight ~ group)
bayes.D9 <- bayes.lm(weight ~ group)

summary(lm.D9)
summary(bayes.D9)





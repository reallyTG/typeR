library(fugue)


### Name: nh1and3
### Title: Smoking Matched Sets with 1 or 3 Controls
### Aliases: nh1and3
### Keywords: datasets

### ** Examples

data(nh1and3)
attach(nh1and3)
table(table(nh1and3$mset))
par(mfrow=c(1,2))
boxplot(homocysteine[1:166]~z[1:166],ylim=c(0,70),main="1-1 match",
  ylab="homocysteine",names=c("Control","Smoker"))
boxplot(homocysteine[167:1370]~z[167:1370],ylim=c(0,70),
  main="1-3 match",ylab="homocysteine",names=c("Control","Smoke"))
detach(nh1and3)




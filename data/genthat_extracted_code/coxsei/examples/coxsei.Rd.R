library(coxsei)


### Name: coxsei
### Title: CoxSEI model
### Aliases: coxsei coxsei.default print.coxsei plot.coxsei summary.coxsei
###   print.summary.coxsei
### Keywords: regression survival

### ** Examples

data(dat,package="coxsei")
acoxsei <- coxsei(dat[,3:5],dat[,1],dat[,2],dat[,6],
                  c(0.2*1:3,log(0.07),log(10)))
summary(acoxsei)
plot(acoxsei,do.points=FALSE)




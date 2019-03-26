library(amen)


### Name: amen-package
### Title: Additive and Multiplicative Effects Models for Networks and
###   Relational Data
### Aliases: amen amen-package
### Keywords: package

### ** Examples



data(YX_frn)
fit<-ame(YX_frn$Y,YX_frn$X,burn=5,nscan=5,odens=1,model="frn")

summary(fit)

plot(fit) 





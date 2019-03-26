library(biglm)


### Name: biglm
### Title: Bounded memory linear regression
### Aliases: biglm update.biglm coef.biglm vcov.biglm print.biglm
###   summary.biglm print.summary.biglm AIC.biglm deviance.biglm
### Keywords: regression

### ** Examples

data(trees)
ff<-log(Volume)~log(Girth)+log(Height)

chunk1<-trees[1:10,]
chunk2<-trees[11:20,]
chunk3<-trees[21:31,]

a <- biglm(ff,chunk1)
a <- update(a,chunk2)
a <- update(a,chunk3)

summary(a)
deviance(a)
AIC(a)




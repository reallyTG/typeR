library(apTreeshape)


### Name: colless
### Title: Compute the Colless' shape statistic on tree data
### Aliases: colless
### Keywords: univar

### ** Examples


## Colless' index for a randomly generated PDA tree (unnormalized value)
tpda<-rtreeshape(1,tip.number=70,model="pda")
colless(tpda[[1]],norm="pda")
  
## Histogram of Colless' indices for randomly generated Yule trees
main="Colless' indices for randomly generated Yule trees"
xlab="Colless' indices"
hist(sapply(rtreeshape(50,tip.number=50,model="yule"),FUN=colless,norm="yule"),
      freq=FALSE,main=main,xlab=xlab)
  
## Change the number of tips
hist(sapply(rtreeshape(50,tip.number=25,model="yule"),FUN=colless,norm="yule"),
      freq=FALSE,main=main,xlab=xlab)





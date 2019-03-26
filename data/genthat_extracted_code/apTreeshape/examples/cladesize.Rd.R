library(apTreeshape)


### Name: cladesize
### Title: Compute the number of children of a randomly chosen node
### Aliases: cladesize
### Keywords: univar

### ** Examples


# Histogram of random clade sizes 
main="Random clade sizes for random generated trees"
xlabel="clade size"
hist(sapply(rtreeshape(100,tip.number=40,model="yule"),FUN=cladesize),
      freq=FALSE,main=main,xlab=xlabel)




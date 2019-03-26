library(GeneClusterNet)


### Name: mExpression
### Title: Gene expression data set of Yeast.
### Aliases: mExpression
### Keywords: datasets

### ** Examples


# load the package 
library(GeneClusterNet)

data(mExpression)

# first 5 rows

Sample=mExpression[1:5,]

plot(1:18,Sample[1,],type="l", ylim=c(min(Sample),max(Sample)),xlab="Time",ylab="Expression",lwd=2)
color=1
for (i in 2:5){
  color=color+1
  lines(1:18,Sample[i,],col=color,lwd=2)
}




library(Barnard)


### Name: barnard.test
### Title: Barnard's Unconditional Test
### Aliases: barnard.test
### Keywords: nonparametric htest

### ** Examples

barnard.test(8,14,1,3)

## Plotting the search for the nuisance parameter for a one-sided test
bt<-barnard.test(8,14,1,3)
plot(bt$nuisance.matrix[,1:2],
     t="l",xlab="nuisance parameter",ylab="p-value")

## Plotting the tables included in the p-value
bt<-barnard.test(40,14,10,30)
bts<-bt$statistic.table
plot(bts[,1],bts[,2],
     col=hsv(bts[,4]/4,1,1),
     t="p",xlab="n1",ylab="n2")

## Plotting the difference between pooled and unpooled tests
bts<-barnard.test(40,14,10,30,pooled=TRUE)$statistic.table
btw<-barnard.test(40,14,10,30,pooled=FALSE)$statistic.table
plot(bts[,1],bts[,2],
     col=c("black","white")[1+as.numeric(bts[,4]==btw[,4])],
     t="p",xlab="n1",ylab="n2")




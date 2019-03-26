library(SimComp)


### Name: ermvnorm
### Title: Multivariate Normal Random Numbers with Exact Parameters
### Aliases: ermvnorm
### Keywords: datagen distribution

### ** Examples

# Example 1:
# A dataset representing one endpoint.

set.seed(1234)
dataset1 <- ermvnorm(n=10,mean=100,sd=10)
dataset1
mean(dataset1)
sd(dataset1)

# Example 2:
# A dataset representing two correlated endpoints.

set.seed(5678)
dataset2 <- ermvnorm(n=10,mean=c(10,120),sd=c(1,10),corr=rbind(c(1,0.7),c(0.7,1)))
dataset2
mean(dataset2[,1]); mean(dataset2[,2])
sd(dataset2[,1]); sd(dataset2[,2])
round(cor(dataset2),3)
pairs(dataset2)

# Example 3:
# A dataset representing three uncorrelated endpoints.

set.seed(9101)
dataset3 <- ermvnorm(n=20,mean=c(1,12,150),sd=c(0.5,2,20))
dataset3
mean(dataset3[,1]); mean(dataset3[,2]); mean(dataset3[,3])
sd(dataset3[,1]); sd(dataset3[,2]); sd(dataset3[,3])
pairs(dataset3)

# Example 4:
# A dataset representing four randomly correlated endpoints.

set.seed(1121)
dataset4 <- ermvnorm(n=10,mean=c(2,10,50,120),sd=c(1,4,8,10),corr=rcm(ncol=4))
dataset4
mean(dataset4[,1]); mean(dataset4[,2]); mean(dataset4[,3]); mean(dataset4[,4])
sd(dataset4[,1]); sd(dataset4[,2]); sd(dataset4[,3]); sd(dataset4[,4])
round(cor(dataset4),3)
pairs(dataset4)




library(ORDER2PARENT)


### Name: blr
### Title: Parent Distribution Estimation with B-Spline Linear Regression
###   Estimator
### Aliases: blr
### Keywords: Order Statistic ecdf

### ** Examples

n.order<-c(20, 20, 60)	# number of observations for each order statistic below.
m<-5	# the size of random samples is 5.
# The three order statistics are 1:5 (the minimum), 3:5 (the sample median), 
# and 5:5 (the maximum)
rank.x<-c(1, 3, 5)
data.example<-list()
for(i in 1:3){
sorted.sample<-t(apply(matrix(rnorm(m*n.order[i]),nr=n.order[i],nc=m), 1, sort))
data.example[[i]]<-sorted.sample[,rank.x[i]]
}
order.example<-rbind(c(1, 5), c(3, 5), c(5, 5), deparse.level=0)
blr.example<-blr(data.example, order.example)




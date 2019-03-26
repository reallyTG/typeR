library(rrcov)


### Name: T2.test
### Title: Robust Hotelling T2 test
### Aliases: T2.test T2.test.default T2.test.formula
### Keywords: htest multivariate

### ** Examples


## One-sample classical test
data(delivery)
delivery.x <- delivery[,1:2]
T2.test(delivery.x)

## One-sample robust test
data(delivery)
delivery.x <- delivery[,1:2]
T2.test(delivery.x, method="mcd")

## Two-sample classical test
data(hemophilia)
grp <-as.factor(hemophilia[,3])
x <- hemophilia[which(grp==levels(grp)[1]),1:2]
y <- hemophilia[which(grp==levels(grp)[2]),1:2]
T2.test(x,y)

## or using the formula interface
T2.test(as.matrix(hemophilia[,-3])~hemophilia[,3])


## Not run: 
##D ## Two-sample robust test
##D T2.test(x,y, method="mcd")    ## error - not yet implemented
## End(Not run)



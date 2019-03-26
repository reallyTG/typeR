library(VIM)


### Name: hotdeck
### Title: Hot-Deck Imputation
### Aliases: hotdeck
### Keywords: manip

### ** Examples


data(sleep)
sleepI <- hotdeck(sleep)
sleepI2 <- hotdeck(sleep,ord_var="BodyWgt",domain_var="Pred")

set.seed(132)
nRows <- 1e3
# Generate a data set with nRows rows and several variables
x<-data.frame(x=rnorm(nRows),y=rnorm(nRows),z=sample(LETTERS,nRows,replace=TRUE),
    d1=sample(LETTERS[1:3],nRows,replace=TRUE),d2=sample(LETTERS[1:2],nRows,replace=TRUE),
    o1=rnorm(nRows),o2=rnorm(nRows),o3=rnorm(100))
origX <- x
x[sample(1:nRows,nRows/10),1] <- NA
x[sample(1:nRows,nRows/10),2] <- NA
x[sample(1:nRows,nRows/10),3] <- NA
x[sample(1:nRows,nRows/10),4] <- NA
xImp <- hotdeck(x,ord_var = c("o1","o2","o3"),domain_var="d2")






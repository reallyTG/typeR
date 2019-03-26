library(fgpt)


### Name: fgstat
### Title: Calculate statistics for FGPT
### Aliases: fgstat
### Keywords: univar

### ** Examples


#### Example for fgrand

## 200 random geographical locations
xy <- array(runif(400,0,2), dim=c(200,2))

## run fgperm to produce 99 randomizations for scale 1
test <- fgperm(xy, scale=1, iter=99, add.obs=TRUE) 

## run fgperm to produce 99 bootstraps for scale 1
test <- fgperm(xy, scale=1, iter=99, FUN=function(x){
          x[sample.int(length(x),replace=TRUE)]}, add.obs=TRUE) 

## 200 times 200 random distances (e.g. genetic relatedness between mated pairs)
trait <- array(rnorm(200*200,0.6,0.1), dim=c(200,200))
## make the observed pairs more alike
diag(trait) <- diag(trait)+0.02

## make two rows and two colums empty
trait[,3] <- NA
trait[,50] <- NA
trait[6,] <- NA
trait[12,] <- NA

## calculate means; will give NAs because there are missing values
calc <- fgstat(test,trait,mean)

## calculate means
calc <- fgstat(test,trait,mean, na.rm=TRUE)

## plot means
hist(calc)
abline(v=calc[1], col="red", lwd=2)
  

  



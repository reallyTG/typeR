library(mistat)


### Name: MPG
### Title: Gasoline Consumption of Cars by Origin
### Aliases: MPG
### Keywords: datasets

### ** Examples

data(MPG)

library(boot)

set.seed(123)

B <- apply(MPG, MARGIN=2, 
           FUN=boot, 
           statistic=function(x, i){
             var(x[i], na.rm = TRUE)
           }, 
           R = 500)

Bt0 <- sapply(B, 
              FUN=function(x) x$t0)

Bt <-  sapply(B, 
              FUN=function(x) x$t)

Bf <- max(Bt0)/min(Bt0)

FBoot <- apply(Bt, MARGIN=1, 
               FUN=function(x){
                 max(x)/min(x)
               })

Bf

quantile(FBoot, 0.95)

sum(FBoot >= Bf)/length(FBoot)

rm(Bt0, Bt, Bf, FBoot)



